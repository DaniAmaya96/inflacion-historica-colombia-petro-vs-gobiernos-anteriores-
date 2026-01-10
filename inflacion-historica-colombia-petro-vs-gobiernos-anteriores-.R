## Librerias
library(dplyr)
library(ggplot2)
library(readxl)
library(ggrepel)

## Datos BanREP

datos_IPC <- read_excel(
  "graficador_series.xlsx",
  col_names = TRUE
) %>%
  slice(-1) 

## Limpieza 
datos_IPC <- datos_IPC %>% 
  rename(
    Fecha = 1,
    Inflacion = 2
  ) %>% 
  mutate(
    Fecha = as.Date(Fecha, format = "%d/%m/%Y"),
    Inflacion = as.numeric(gsub(",", ".", Inflacion)),
    Año = as.numeric(format(Fecha, "%Y"))
  )

##  Periodos Presidenciales 
periodos <- data.frame(
  Presidente = c("Samper", "Pastrana", "Uribe I", "Uribe II", "Santos I", "Santos II", "Duque", "Petro"),
  Inicio = c(1994, 1998, 2002, 2006, 2010, 2014, 2018, 2022),
  Fin = c(1998, 2002, 2006, 2010, 2014, 2018, 2022, 2026)
)

## Cruzando Datos 
datos_plot <- datos_IPC %>%
  filter(Año >= 1994) %>%
  rowwise() %>%
  mutate(
    Presidencia = periodos$Presidente[which(Año > periodos$Inicio & Año <= periodos$Fin)][1],
    Inicio_Gob = periodos$Inicio[which(Año > periodos$Inicio & Año <= periodos$Fin)][1],
    Ano_Mandato = Año - Inicio_Gob
  ) %>%
  filter(!is.na(Presidencia)) %>% 
  ungroup()

## CreandoSubconjuntoDatos
datos_etiquetas <- datos_plot %>%
  group_by(Presidencia) %>%
  filter(Ano_Mandato == max(Ano_Mandato))

## Colores
mis_colores <- c(
  "Samper" = "grey80", "Pastrana" = "grey80", 
  "Uribe I" = "grey80", "Uribe II" = "grey80",
  "Santos I" = "grey80", "Santos II" = "grey80", 
  "Duque" = "grey60", 
  "Petro" = "#D93025" 
)

# Grafica
ggplot(datos_plot, aes(x = Ano_Mandato, y = Inflacion, group = Presidencia, color = Presidencia)) +
  geom_line(data = filter(datos_plot, Presidencia != "Petro"), size = 1, alpha = 0.8) +
  geom_line(data = filter(datos_plot, Presidencia == "Petro"), size = 1.5) +
  geom_point(size = 2) +
  geom_text_repel(
    data = datos_etiquetas,
    aes(label = paste0(Presidencia, " (", Inflacion, "%)")),
    nudge_x = 0.2, 
    direction = "y",
    hjust = 0,
    size = 4,
    fontface = "bold"
  ) +
  
  scale_color_manual(values = mis_colores) +
  scale_x_continuous(limits = c(0.8, 5.5), breaks = c(1,2,3,4), labels = c("Año 1", "Año 2", "Año 3", "Año 4")) +
  labs(
    title = "Evolución de la Inflación: Petro vs. Gobiernos Anteriores",
    subtitle = "Comparación año a año del mandato presidencial",
    x = "", 
    y = "Inflación Anual (%)",
    caption = "Fuente: DANE compilado por Banrep"
  ) +
  theme_minimal(base_size = 14) +
  theme(
    legend.position = "none",
    panel.grid.minor = element_blank(),
    panel.grid.major.x = element_blank(),
    plot.title = element_text(face = "bold", size = 16),
    axis.text = element_text(color = "black")
  )
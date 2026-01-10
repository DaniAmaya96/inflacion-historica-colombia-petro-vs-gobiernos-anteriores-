# Análisis de Inflación en Colombia por Periodo Presidencial

Este proyecto analiza la evolución histórica del Índice de Precios al Consumidor (IPC) en Colombia, comparando el comportamiento de la inflación durante los diferentes mandatos presidenciales desde 1994 hasta la actualidad.

## Objetivo
Visualizar de manera rigurosa la tendencia inflacionaria, corrigiendo sesgos de comparación al alinear los datos por "Año de Gobierno" en lugar de año calendario.

## Metodología
- **Datos:** Fuente oficial del Banco de la República ( Con base en DANE).
- **Enfoque:** Comparación de series de tiempo ajustadas al inicio de cada mandato constitucional (Agosto).

### ⚠️ Nota Importante sobre la Asignación de Años
Para garantizar una comparación justa entre periodos completos de gestión, se utilizó la siguiente regla metodológica estándar:

1. **Año de Empalme (El año de cambio de mando):**
   Los años donde ocurre la posesión presidencial (ej: 1998, 2002, 2010, 2018, 2022) se asignan al **Presidente Saliente**.
   * *Razón:* El presidente saliente gobierna de enero a agosto (8 meses, ~66% del año), por lo que el cierre de inflación de ese año es mayoritariamente resultado de su gestión y herencia.
   * *Ejemplo:* La inflación de cierre de 2022 (13.12%) se asigna al cierre del gobierno Duque (su Año 4).

2. **Año 1 del Nuevo Gobierno:**
   Se considera "Año 1" al primer año calendario **completo** bajo el nuevo mandato.
   * *Ejemplo:* Para el gobierno actual (Petro), el "Año 1" en la gráfica corresponde a **2023**.

Esto evita atribuir al nuevo gobierno la inercia inflacionaria inmediata del año en que apenas se posesiona.

## Autor
Daniel Ricardo Amaya Alba 

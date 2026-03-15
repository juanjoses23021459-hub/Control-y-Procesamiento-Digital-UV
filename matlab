% =========================================================================
% UNIVERSIDAD VERACRUZANA - FACULTAD DE INGENIERÍA
% CARRERA: INGENIERÍA EN INSTRUMENTACIÓN ELECTRÓNICA
% 
% PROYECTO: Sistema de Procesamiento y Automatización
% ETAPA: 2 - Avances de Integración Hardware-Software
% 
% AUTOR: Juan José Araujo Colorado
% FECHA DE INICIO: 10 de marzo, 2026
% FECHA DE ENTREGA: 17 de abril, 2026
% VERSIÓN: 2.0.1 (Actualizada - Demostración de funcionamiento básico)
% 
% DESCRIPCIÓN:
% Script para la adquisición de señales y control de sistemas automatizados.
% Implementa la lectura de datos, lógica de decisión y generación de 
% salidas de control, diseñado para validación de hardware en tiempo real.
% =========================================================================

clear; clc; close all;

%% CONFIGURACIÓN DE PARÁMETROS
fs = 1000;              % Frecuencia de muestreo (Hz)
t = 0:1/fs:1;           % Vector de tiempo (1 segundo)
umbral_critico = 0.7;   % Valor de activación para el actuador

fprintf('--- Inicializando Sistema: Prototipo Etapa 2 (Juan Araujo) ---\n');

%% SIMULACIÓN DE ADQUISICIÓN DE HARDWARE
% En un entorno real, aquí se usaría: s = serialport("COM3", 9600);
% O funciones de Data Acquisition Toolbox (daq).
señal_entrada = sin(2*pi*5*t) + 0.2*randn(size(t)); % Señal con ruido

%% LÓGICA DE PROCESAMIENTO Y AUTOMATIZACIÓN
% Aplicamos un rectificador o filtro simple para la toma de decisiones
señal_procesada = abs(señal_entrada);
estado_actuador = señal_procesada > umbral_critico;

%% VISUALIZACIÓN DE RESULTADOS (Para el reporte en docs/)
figure('Name', 'Avance Etapa 2 - Juan José Araujo');
subplot(2,1,1);
plot(t, señal_entrada, 'b'); hold on;
yline(umbral_critico, '--r', 'Umbral de Control');
title('Señal de Entrada del Sensor');
ylabel('Amplitud (V)');
grid on;

subplot(2,1,2);
stem(t, estado_actuador, 'Color', [0 0.5 0], 'Marker', 'none');
title('Estado del Actuador (Salida Digital)');
xlabel('Tiempo (s)');
ylabel('On / Off');
grid on;

fprintf('Procesamiento completado. Generando gráficas para carpeta /docs...\n');

%% GUARDADO AUTOMÁTICO PARA REPOSITORIO
% Esto facilita tener las fotos listas para la carpeta docs/
if ~exist('docs', 'dir')
    mkdir('docs');
end
saveas(gcf, 'docs/resultado_integracion_hardware.png');

fprintf('--- Sistema en Estado Seguro ---\n');

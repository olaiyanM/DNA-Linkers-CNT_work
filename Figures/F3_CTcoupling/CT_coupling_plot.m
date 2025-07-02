% Load files
data_A = load('DLCcp1.mat'); % DNA-Linker-CNT no changes made to H
data_B = load('DLCcp2.mat'); % DNA-Linker-CNT DNA-CNT coupling = 0
data_C = load('DLCcp3.mat'); % DNA-Linker-CNT Linker coupling with DNA and CNT = 0
data_D = load('DECcp1.mat'); % DNA-Ester-CNT no changes made to H
data_E = load('DECcp2.mat'); % DNA-Ester-CNT DNA-CNT coupling = 0
data_F = load('DECcp3.mat'); % DNA-Ester-CNT Ester coupling with DNA and CNT = 0

% Extract energies and transmission data
energy_A = data_A.Energy; T_A = data_A.T;
energy_B = data_B.Energy; T_B = data_B.T;
energy_C = data_C.Energy; T_C = data_C.T;
energy_D = data_D.Energy; T_D = data_D.T;
energy_E = data_E.Energy; T_E = data_E.T;
energy_F = data_F.Energy; T_F = data_F.T;

% Interpolate missing points using spline interpolation to smooth the data
energy_C_interp = linspace(min(energy_C), max(energy_C), length(energy_C));
T_C_interp = interp1(energy_C, T_C, energy_C_interp, 'spline'); % Use spline for smooth interpolation

energy_F_interp = linspace(min(energy_F), max(energy_F), length(energy_F));
T_F_interp = interp1(energy_F, T_F, energy_F_interp, 'spline'); % Use spline for smooth interpolation

% Define HOMO and LUMO regions
HOMO_LUMO_DLC = [-3.94, -3.11]; % DLC HOMO-LUMO
HOMO_LUMO_DEC = [-4.05, -3.37]; % DEC HOMO-LUMO

% Initialize figure
figure;
set(gcf, 'units','normalized','outerposition',[0 0 1 1]);

% Shading colors
light_pink = [1, 0.8, 0.8];
light_blue = [0.8, 0.8, 1];
burgundy = [0.6, 0, 0.4]; % Darker pink (burgundy)
dark_blue = [0, 0, 0.8]; % Dark blue

% Plot for DNA-Amino-CNT (b)
subplot('Position', [0.07 0.55 0.28 0.35]); % Adjusted position
semilogy(energy_A, T_A, 'k', 'LineWidth', 4); 
hold on;
fill([-7, HOMO_LUMO_DLC(1), HOMO_LUMO_DLC(1), -7], [1e-8, 1, 1, 1e-8], light_pink, 'EdgeColor', 'none', 'FaceAlpha', 0.5);
fill([HOMO_LUMO_DLC(2), 1, 1, HOMO_LUMO_DLC(2)], [1e-8, 1, 1, 1e-8], light_blue, 'EdgeColor', 'none', 'FaceAlpha', 0.5);
hold off;
xlabel('Energy (eV)', 'FontSize', 22, 'FontWeight', 'Bold', 'FontName', 'Arial');
ylabel('Transmission', 'FontSize', 22, 'FontWeight', 'Bold', 'FontName', 'Arial'); 
title('', 'FontSize', 24, 'FontWeight', 'Bold', 'FontName', 'Arial');
xlim([-7 1]);
ylim([1e-8 1]);
set(gca, 'XTick', -7:1:1, 'FontWeight', 'Bold', 'FontSize', 20, 'FontName', 'Arial', 'LineWidth', 1.5, 'YTick', [1e-8 1e-6 1e-4 1e-2 1], 'Box', 'on', 'TickDir', 'out');

% Plot for DNA-Amino-CNT (c)
subplot('Position', [0.37 0.55 0.28 0.35]); % Adjusted position
semilogy(energy_B, T_B, 'Color', burgundy, 'LineWidth', 4); 
hold on;
fill([-7, HOMO_LUMO_DLC(1), HOMO_LUMO_DLC(1), -7], [1e-8, 1, 1, 1e-8], light_pink, 'EdgeColor', 'none', 'FaceAlpha', 0.5);
fill([HOMO_LUMO_DLC(2), 1, 1, HOMO_LUMO_DLC(2)], [1e-8, 1, 1, 1e-8], light_blue, 'EdgeColor', 'none', 'FaceAlpha', 0.5);
hold off;
xlabel('Energy (eV)', 'FontSize', 22, 'FontWeight', 'Bold', 'FontName', 'Arial');
title('', 'FontSize', 24, 'FontWeight', 'Bold', 'FontName', 'Arial');
xlim([-7 1]);
ylim([1e-8 1]);
set(gca, 'XTick', -7:1:1, 'FontWeight', 'Bold', 'FontSize', 20, 'FontName', 'Arial', 'LineWidth', 1.5, 'Box', 'on', 'TickDir', 'out', 'YTickLabel', []);

% Plot for DNA-Amino-CNT (d)
subplot('Position', [0.67 0.55 0.28 0.35]); % Adjusted position
semilogy(energy_C_interp, T_C_interp, 'Color', dark_blue, 'LineWidth', 4); 
hold on;
fill([-7, HOMO_LUMO_DLC(1), HOMO_LUMO_DLC(1), -7], [1e-8, 1, 1, 1e-8], light_pink, 'EdgeColor', 'none', 'FaceAlpha', 0.5);
fill([HOMO_LUMO_DLC(2), 1, 1, HOMO_LUMO_DLC(2)], [1e-8, 1, 1, 1e-8], light_blue, 'EdgeColor', 'none', 'FaceAlpha', 0.5);
hold off;
xlabel('Energy (eV)', 'FontSize', 22, 'FontWeight', 'Bold', 'FontName', 'Arial');
title('', 'FontSize', 24, 'FontWeight', 'Bold', 'FontName', 'Arial');
xlim([-7 1]);
ylim([1e-8 1]);
set(gca, 'XTick', -7:1:1, 'FontWeight', 'Bold', 'FontSize', 20, 'FontName', 'Arial', 'LineWidth', 1.5, 'Box', 'on', 'TickDir', 'out', 'YTickLabel', []);

% Plot for DNA-Ester-CNT (e)
subplot('Position', [0.07 0.1 0.28 0.35]); % Adjusted position
semilogy(energy_D, T_D, 'k', 'LineWidth', 4); 
hold on;
fill([-7, HOMO_LUMO_DEC(1), HOMO_LUMO_DEC(1), -7], [1e-8, 1, 1, 1e-8], light_pink, 'EdgeColor', 'none', 'FaceAlpha', 0.5);
fill([HOMO_LUMO_DEC(2), 1, 1, HOMO_LUMO_DEC(2)], [1e-8, 1, 1, 1e-8], light_blue, 'EdgeColor', 'none', 'FaceAlpha', 0.5);
hold off;
xlabel('Energy (eV)', 'FontSize', 22, 'FontWeight', 'Bold', 'FontName', 'Arial');
ylabel('Transmission', 'FontSize', 22, 'FontWeight', 'Bold', 'FontName', 'Arial'); 
title('', 'FontSize', 24, 'FontWeight', 'Bold', 'FontName', 'Arial');
xlim([-7 1]);
ylim([1e-8 1]);
set(gca, 'XTick', -7:1:1, 'FontWeight', 'Bold', 'FontSize', 20, 'FontName', 'Arial', 'LineWidth', 1.5, 'YTick', [1e-8 1e-6 1e-4 1e-2 1], 'Box', 'on', 'TickDir', 'out');

% Plot for DNA-Ester-CNT (f)
subplot('Position', [0.37 0.1 0.28 0.35]); % Adjusted position
semilogy(energy_E, T_E, 'Color', burgundy, 'LineWidth', 4); 
hold on;
fill([-7, HOMO_LUMO_DEC(1), HOMO_LUMO_DEC(1), -7], [1e-8, 1, 1, 1e-8], light_pink, 'EdgeColor', 'none', 'FaceAlpha', 0.5);
fill([HOMO_LUMO_DEC(2), 1, 1, HOMO_LUMO_DEC(2)], [1e-8, 1, 1, 1e-8], light_blue, 'EdgeColor', 'none', 'FaceAlpha', 0.5);
hold off;
xlabel('Energy (eV)', 'FontSize', 22, 'FontWeight', 'Bold', 'FontName', 'Arial');
title('', 'FontSize', 24, 'FontWeight', 'Bold', 'FontName', 'Arial');
xlim([-7 1]);
ylim([1e-8 1]);
set(gca, 'XTick', -7:1:1, 'FontWeight', 'Bold', 'FontSize', 20, 'FontName', 'Arial', 'LineWidth', 1.5, 'Box', 'on', 'TickDir', 'out', 'YTickLabel', []);

% Plot for DNA-Ester-CNT (g)
subplot('Position', [0.67 0.1 0.28 0.35]); % Adjusted position
semilogy(energy_F_interp, T_F_interp, 'Color', dark_blue, 'LineWidth', 4); 
hold on;
fill([-7, HOMO_LUMO_DEC(1), HOMO_LUMO_DEC(1), -7], [1e-8, 1, 1, 1e-8], light_pink, 'EdgeColor', 'none', 'FaceAlpha', 0.5);
fill([HOMO_LUMO_DEC(2), 1, 1, HOMO_LUMO_DEC(2)], [1e-8, 1, 1, 1e-8], light_blue, 'EdgeColor', 'none', 'FaceAlpha', 0.5);
hold off;
xlabel('Energy (eV)', 'FontSize', 22, 'FontWeight', 'Bold', 'FontName', 'Arial');
title('', 'FontSize', 24, 'FontWeight', 'Bold', 'FontName', 'Arial');
xlim([-7 1]);
ylim([1e-8 1]);
set(gca, 'XTick', -7:1:1, 'FontWeight', 'Bold', 'FontSize', 20, 'FontName', 'Arial', 'LineWidth', 1.5, 'Box', 'on', 'TickDir', 'out', 'YTickLabel', []);

set(gcf, 'Color', 'w');

% Load data files
data_DLC_init = load('DLC_Initial.mat'); % DNA-Amino-CNT Initial
data_DLC_final = load('DLC_Final.mat');  % DNA-Amino-CNT Final
data_DEC_init = load('DEC_Initial.mat'); % DNA-Ester-CNT Initial
data_DEC_final = load('DEC_Final.mat');  % DNA-Ester-CNT Final

% Extract energies and transmission data
energy_DLC_init = data_DLC_init.Energy; T_DLC_init = data_DLC_init.T;
energy_DLC_final = data_DLC_final.Energy; T_DLC_final = data_DLC_final.T;
energy_DEC_init = data_DEC_init.Energy; T_DEC_init = data_DEC_init.T;
energy_DEC_final = data_DEC_final.Energy; T_DEC_final = data_DEC_final.T;

% HOMO and LUMO values conversion (Multiply by 27.2114)
factor = 27.2114;
HOMO_LUMO_DLC_init = [factor * -0.14654, factor * -0.11622]; % DLC Initial: HOMO from right, LUMO from left
HOMO_LUMO_DLC_final = [factor * -0.14488, factor * -0.11422]; % DLC Final: HOMO from right, LUMO from left
HOMO_LUMO_DEC_init = [factor * -0.13972, factor * -0.12319]; % DEC Initial: HOMO from right, LUMO from left
HOMO_LUMO_DEC_final = [factor * -0.14884, factor * -0.12398]; % DEC Final: HOMO from right, LUMO from left

% Colors
black = [0, 0, 0];
burgundy = [0.6, 0, 0.4];

% Create figure with two subplots
figure;
set(gcf, 'units','normalized','outerposition',[0 0 1 0.5]);

% Left Plot: DNA-Amino Linker-CNT Structure
subplot(1,2,1);
subplot('Position', [0.08, 0.15, 0.42, 0.75]); 
semilogy(energy_DLC_init, T_DLC_init, 'Color', black, 'LineWidth', 3); hold on;
semilogy(energy_DLC_final, T_DLC_final, 'Color', burgundy, 'LineWidth', 3);

% Add HOMO and LUMO as vertical dashed lines (50% transparent)
xline(HOMO_LUMO_DLC_init(1), '--', 'Color', [0 0 0 0.5], 'LineWidth', 2);
xline(HOMO_LUMO_DLC_init(2), '--', 'Color', [0 0 0 0.5], 'LineWidth', 2);
xline(HOMO_LUMO_DLC_final(1), '--', 'Color', [burgundy, 0.5], 'LineWidth', 2);
xline(HOMO_LUMO_DLC_final(2), '--', 'Color', [burgundy, 0.5], 'LineWidth', 2);

xlabel('Energy (eV)', 'FontSize', 16, 'FontWeight', 'Bold');
ylabel('Transmission', 'FontSize', 16, 'FontWeight', 'Bold');
title('DNA-Amino Linker-CNT', 'FontSize', 18, 'FontWeight', 'Bold');
legend('Parallel', 'Perpendicular', 'Location', 'Best');
xlim([-7 1]);
ylim([1e-8 10]);
set(gca, 'FontSize', 16, 'LineWidth', 1.5, 'YScale', 'log');

% Right Plot: DNA-Ester Linker-CNT Structure
subplot(1,2,2);
subplot('Position', [0.54, 0.15, 0.42, 0.75])
semilogy(energy_DEC_init, T_DEC_init, 'Color', black, 'LineWidth', 3); hold on;
semilogy(energy_DEC_final, T_DEC_final, 'Color', burgundy, 'LineWidth', 3);

% Add HOMO and LUMO as vertical dashed lines (50% transparent)
xline(HOMO_LUMO_DEC_init(1), '--', 'Color', [0 0 0 0.5], 'LineWidth', 2);
xline(HOMO_LUMO_DEC_init(2), '--', 'Color', [0 0 0 0.5], 'LineWidth', 2);
xline(HOMO_LUMO_DEC_final(1), '--', 'Color', [burgundy, 0.5], 'LineWidth', 2);
xline(HOMO_LUMO_DEC_final(2), '--', 'Color', [burgundy, 0.5], 'LineWidth', 2);

xlabel('Energy (eV)', 'FontSize', 16, 'FontWeight', 'Bold');
title('DNA-Ester Linker-CNT ', 'FontSize', 18, 'FontWeight', 'Bold');
legend('Parallel', 'Perpendicular', 'Location', 'Best');
xlim([-7 1]);
ylim([1e-8 10]);
set(gca, 'FontSize', 16, 'LineWidth', 1.5, 'YScale', 'log', 'YTickLabel', []);

set(gcf, 'Color', 'w');


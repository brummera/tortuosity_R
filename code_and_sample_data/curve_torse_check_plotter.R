curve_torse_check_plotter <- function(vessel_coords, plot_type = 1, filter_torsion_spikes = TRUE, save_plot = FALSE){
  ## This function serves as an example for plotting curvature/torsion versus normalized arclenth, curvature/curvature-error versus normalized arclength, and torsion/torsion-error versus normalized arclength.
  
  source("./tortuosity_metrics.R")
  source("./frenet_vectors.R")
  
  
  tortuosity_metrics <- curvature_torsion_calculator(tangent = vessel_coords[[1]], normal = vessel_coords[[2]], binormal = vessel_coords[[3]], vessel_coords = vessel_coords[[4]], filter_torsion_spikes = filter_torsion_spikes)
  
  
  ## Plotting curvature and torsion in one graph
  if(plot_type == 1){
    if(save_plot){
      png(filename = "curve_torse_vs_arclength.png", width = 8, height = 6, pointsize = 12)
      par(mfrow = c(2, 1),     # 2x2 layout
          oma = c(5, 1, 1, 1), # 4 rows of text at the outer left and bottom margin
          mar = c(1, 3, 1, 0), # space for one row of text at ticks and to separate plots
          mgp = c(2, 1, 0)) 
      plot(x = tortuosity_metrics$arclength/max(tortuosity_metrics$arclength, na.rm = T), tortuosity_metrics$curvature, xlab = NULL, ylab = "Curvature", axes = FALSE, main = 'Curvature and Torsion vs Normalized Arclength')
      axis(side = 1, at = seq(0, 1, by = 0.1), labels = FALSE)
      axis(side = 2, labels = TRUE)
      plot(x = tortuosity_metrics$arclength/max(tortuosity_metrics$arclength, na.rm = T), tortuosity_metrics$torsion, ylab = "Torsion", axes = FALSE)
      axis(side = 1, at = seq(0, 1, by = 0.1), labels = TRUE)
      axis(side = 2, labels = TRUE)
      title(xlab = "Normalized Arclength", outer = TRUE)
      dev.off()
    }else{
      par(mfrow = c(2, 1),     # 2x2 layout
          oma = c(5, 1, 1, 1), # 4 rows of text at the outer left and bottom margin
          mar = c(1, 3, 1, 0), # space for one row of text at ticks and to separate plots
          mgp = c(2, 1, 0)) 
      plot(x = tortuosity_metrics$arclength/max(tortuosity_metrics$arclength, na.rm = T), tortuosity_metrics$curvature, xlab = NULL, ylab = "Curvature", axes = FALSE, main = 'Curvature and Torsion vs Normalized Arclength')
      axis(side = 1, at = seq(0, 1, by = 0.1), labels = FALSE)
      axis(side = 2, labels = TRUE)
      plot(x = tortuosity_metrics$arclength/max(tortuosity_metrics$arclength, na.rm = T), tortuosity_metrics$torsion, ylab = "Torsion", axes = FALSE)
      axis(side = 1, at = seq(0, 1, by = 0.1), labels = TRUE)
      axis(side = 2, labels = TRUE)
      title(xlab = "Normalized Arclength", outer = TRUE)
    }
  }
  
  
  ## Plotting curvature and curvature check in one graph
  if(plot_type == 2){
    if(save_plot){
      png(filename = "curve_curvechk_vs_arclength.png", width = 8, height = 6, pointsize = 12)
      par(mfrow = c(2, 1),     # 2x2 layout
          oma = c(5, 1, 1, 1), # 4 rows of text at the outer left and bottom margin
          mar = c(1, 3, 1, 0), # space for one row of text at ticks and to separate plots
          mgp = c(2, 1, 0))
      plot(x = tortuosity_metrics$arclength/max(tortuosity_metrics$arclength, na.rm = T), tortuosity_metrics$curvature, xlab = NULL, ylab = "Curvature", axes = FALSE, main = "Curvature and Curvature Check vs Normalized Arclength")
      axis(side = 1, at = seq(0, 1, by = 0.1), labels = FALSE)
      axis(side = 2, labels = TRUE)
      plot(x = tortuosity_metrics$arclength/max(tortuosity_metrics$arclength, na.rm = T), tortuosity_metrics$curvature_check, ylab = "Curvature Check", axes = FALSE)
      axis(side = 1, at = seq(0, 1, by = 0.1), labels = TRUE)
      axis(side = 2, labels = TRUE)
      title(xlab = "Normalized Arclength", outer = TRUE)
      dev.off()
    }else{
      par(mfrow = c(2, 1),     # 2x2 layout
          oma = c(5, 1, 1, 1), # 4 rows of text at the outer left and bottom margin
          mar = c(1, 3, 1, 0), # space for one row of text at ticks and to separate plots
          mgp = c(2, 1, 0))
      plot(x = tortuosity_metrics$arclength/max(tortuosity_metrics$arclength, na.rm = T), tortuosity_metrics$curvature, xlab = NULL, ylab = "Curvature", axes = FALSE, main = "Curvature and Curvature Check vs Normalized Arclength")
      axis(side = 1, at = seq(0, 1, by = 0.1), labels = FALSE)
      axis(side = 2, labels = TRUE)
      plot(x = tortuosity_metrics$arclength/max(tortuosity_metrics$arclength, na.rm = T), tortuosity_metrics$curvature_check, ylab = "Curvature Check", axes = FALSE)
      axis(side = 1, at = seq(0, 1, by = 0.1), labels = TRUE)
      axis(side = 2, labels = TRUE)
      title(xlab = "Normalized Arclength", outer = TRUE)
    }
  }
  
  
  
  ## Plotting torsion and torsion check in one graph
  if(plot_type == 3){
    if(save_plot){
      png(filename = "torse_torsechk_vs_arclength.png", width = 8, height = 6, pointsize = 12)
      par(mfrow = c(2, 1),     # 2x2 layout
          oma = c(5, 1, 1, 1), # 4 rows of text at the outer left and bottom margin
          mar = c(1, 3, 1, 0), # space for one row of text at ticks and to separate plots
          mgp = c(2, 1, 0))
      plot(x = tortuosity_metrics$arclength/max(tortuosity_metrics$arclength, na.rm = T), tortuosity_metrics$torsion, xlab = NULL, ylab = "Torsion", axes = FALSE, main = "Torsion and Torsion Check vs Normalized Arclength")
      axis(side = 1, at = seq(0, 1, by = 0.1), labels = FALSE)
      axis(side = 2, labels = TRUE)
      plot(x = tortuosity_metrics$arclength/max(tortuosity_metrics$arclength, na.rm = T), tortuosity_metrics$torsion_check, ylab = "Torsion Check", axes = FALSE)
      axis(side = 1, at = seq(0, 1, by = 0.1), labels = TRUE)
      axis(side = 2, labels = TRUE)
      title(xlab = "Normalized Arclength", outer = TRUE)
      dev.off()
    }else{
      par(mfrow = c(2, 1),     # 2x2 layout
          oma = c(5, 1, 1, 1), # 4 rows of text at the outer left and bottom margin
          mar = c(1, 3, 1, 0), # space for one row of text at ticks and to separate plots
          mgp = c(2, 1, 0))
      plot(x = tortuosity_metrics$arclength/max(tortuosity_metrics$arclength, na.rm = T), tortuosity_metrics$torsion, xlab = NULL, ylab = "Torsion", axes = FALSE, main = "Torsion and Torsion Check vs Normalized Arclength")
      axis(side = 1, at = seq(0, 1, by = 0.1), labels = FALSE)
      axis(side = 2, labels = TRUE)
      plot(x = tortuosity_metrics$arclength/max(tortuosity_metrics$arclength, na.rm = T), tortuosity_metrics$torsion_check, ylab = "Torsion Check", axes = FALSE)
      axis(side = 1, at = seq(0, 1, by = 0.1), labels = TRUE)
      axis(side = 2, labels = TRUE)
      title(xlab = "Normalized Arclength", outer = TRUE)
    }
  }
}
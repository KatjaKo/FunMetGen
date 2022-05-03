library(forcats)

all_comp_fam_abund$Comparison <- factor(all_comp_fam_abund$Comparison , levels = c("DE_SE", "DE_ES", "ES_SE"),
                                labels = c("Germany vs. Sweden", "Germany vs. Spain", "Spain vs. Sweden"))

ggplot(all_comp_fam_abund, aes(x = fct_rev(enzClass), y = logFC, fill = abundant)) + 
  geom_point(aes(size=AveExpr), alpha=0.5, na.rm = T, shape = 21, colour = "black") +
  theme(axis.text.x = element_text(color = "black", size = 12),
        axis.text.y = element_text(color = "black", size = 12),
        axis.title.y = element_text(size = 14),
        axis.title.x = element_text(size = 14), legend.position = "right") +
        coord_flip() +  labs(fill = "Climatic region", size ="Mean abundance") +
        geom_hline(yintercept = 0, linetype="dotted")  + facet_grid(~Comparison) +
        scale_fill_manual(values = c("#9C964A", "#79402E", "#46ACC8")) + 
        theme_bw() + 
        labs(y = "\nLog2 fold-change", x = "Enzyme class") + scale_size(range = c(0, 10)) + theme(axis.text = element_text(size = 12)) + 
  theme(axis.title = element_text(size = 12)) +
  theme(legend.title = element_text(size = 12)) + 
  theme(legend.text = element_text(size = 12)) + 
  theme(strip.text.x = element_text(size = 12))

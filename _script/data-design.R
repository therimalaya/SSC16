df <- data.frame(
  id = factor(1:10, levels = 1:10),
  x = c(
    paste0("Number of Predictors\n", "p:", "50 and 250"),
    paste0("Level of Multicollinearity\n", 
           "gamma: 0.2 and 0.9"),
    paste0("Level of Response Correlation\n",
           "eta: 0, 0.4, 0.8 and 1.2"),
    paste0("Position of relevant predictor components\n",
           "relpos: 1, 2, 3, 4 and 5, 6, 7, 8"),
    paste0("Methods\n PCR, PLS1, PLS2, Xenv and Senv"),
    paste0("Number of Components\n 0, 1, 2, ..., 10"),
    paste0("Y", 1:4)
  ),
  fct = c(rep("Factors", 6), rep("Responses", 4))
)

data_design_tbl <- ggplot(df, aes(x, y = 0)) +
  geom_tile(aes(fill = fct), alpha = 0.5, show.legend = FALSE,
            color = "black") +
  geom_text(aes(label = x), angle = 90, hjust = 1, nudge_y = 0.45,
            family = "mono", size = rel(6), lineheight=0.9, parse = FALSE) +
  facet_grid(. ~ fct, drop = TRUE, scales = 'free_x',
             space = 'free_x') +
  theme_void(base_size = 16) +
  theme(
    strip.text = element_text(
      size = rel(1.5),
      margin = unit(c(2, 0, 3, 0), "mm"),
    ),
    strip.background = element_rect(
      fill = "lightgrey",
      color = "darkgrey",
      size = 1
    ),
    panel.spacing = unit(0, "mm"),
    plot.margin = unit(c(5, 5, 5, 5), "mm"),
    plot.subtitle = element_text(margin = unit(c(2, 0, 5, 0), "mm"))
  ) +
  scale_x_discrete(expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0)) +
  labs(title = "Data for further analysis",
       subtitle = "Response can be Average Miniumum Error or\nAvg. Number of Components used to obtain Minimum Error")


# ggsave(plot = plt, filename = "_images/data-design.svg", width = 7, height = 5.7, unit = "in")

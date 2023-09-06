library(tidyverse)
library(ggplot2)
library(palmerpenguins)

# --------------------Question 1------------------------------------------------
df <- drop_na(penguins)

ggplot(df, 
       aes(x = body_mass_g)) +
  geom_density(aes(fill = species,
                   colour = species,
                   group = species),
               alpha = 0.5) +
  facet_wrap(sex ~ .,
             ncol = 1) +
  labs(x = "Body Mass (g)",
       fill = "Species",) +
  scale_colour_discrete(guide = FALSE)+
  theme(legend.position = "right")
  
# --------------------- Question 2 ---------------------------------------------
peng <- drop_na(penguins)
ggplot(
  peng,
  aes(x = flipper_length_mm,
      y = bill_length_mm,
      colour = species)
) +
  geom_point(
    aes(colour = species,
        shape = species),
    size = 3,
    alpha = 0.7
  ) +
  geom_smooth(method = "lm") +
  
  labs(title = "Flipper and bill length",
       subtitle = ("Dimesions for Adelie, Chinstrap and Gentoo Penguins at Palmer Station LTER"),
       x = "Flipper length (mm)",
       y = "Bill length (mm) ",
       colour = "Penguin Species",
       shape = "Penguin Species"
  ) + 
  theme(legend.position = c(0.85, 0.2),
        legend.background = element_rect(fill = "transparent", 
                                         linetype = NULL)) -> p 
muaz <- c("#ffa333","#b247f3","#33a2a2")

p + scale_color_manual(values = muaz)

################################################################################
#                      Data Visualization Workshop Series                      #
#     "Designing Charts in R: Reproducible Graphic Design with {ggplot2}"      #
#                       Cédric Scherer | March 9, 2023                         #
################################################################################


## To follow the workshop, you need to have a recent version of R and RStudio
## installed on your machine. Download R via https://cloud.r-project.org/ and 
## RStudio Desktop via https://posit.co/download/rstudio-desktop/

## This is an R script. 
## - non-empty lines without that don not start with a hash tag are code
##   -> run the code by clicking the "Run" button
##   -> run the code by placing your cursor in that line and hit Cmd+Enter
##   -> run the code by copy-pasting your code into the console (not preferred)
## - Lines that start with a hash tag are comments, i.e. are not run.
##   -> You can also add comments after your code as illustrated below:

1  ## the 1 on the left is code, everything after the hash tag is not evaluated



## to run all codes, install the following typefaces and restart RStudio:
## Asap Condensed, Spline Sans, Spline Sans Mono, Cabinet Grotesk (Black)
## (all font files are provided in the `fonts` folder) 

## also, install the following packages: 
install.packages("ggplot2", "scales", "ragg", "RColorbrewer", "rcartocolor", "scico")




## -----------------------------------------------------------------------------
# install.packages("ggplot2")
library(ggplot2)


## -----------------------------------------------------------------------------
# install.packages("tidyverse")
# library(tidyverse)


## -----------------------------------------------------------------------------
bikes <- readr::read_csv(
  "./data/london-bikes-custom.csv",
  ## or: "https://cedricscherer.com/data/london-bikes-custom.csv"
  col_types = "Dcfffilllddddc"
)

bikes$season <- forcats::fct_inorder(bikes$season)


## -----------------------------------------------------------------------------
?ggplot


## -----------------------------------------------------------------------------
ggplot(data = bikes)


## -----------------------------------------------------------------------------
ggplot(data = bikes) +
  aes(x = temp_feel, y = count)


## -----------------------------------------------------------------------------
ggplot(
  data = bikes,
  mapping = aes(x = temp_feel, y = count)
)


## -----------------------------------------------------------------------------
ggplot(
  bikes,
  aes(x = temp_feel, y = count)
)


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count)
  ) +
  geom_point()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = humidity)
  ) +
  geom_histogram()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = season, y = count)
  ) +
  geom_boxplot()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count)
  ) +
  geom_point(
    color = "dodgerblue",
    alpha = .5,
    shape = "X",
    stroke = 1,
    size = 4
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count)
  ) +
  geom_point(
    color = "dodgerblue",
    alpha = .5
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count)
  ) +
  geom_point(
    aes(color = season),
    alpha = .5
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count)
  ) +
  geom_point(
    aes(color = temp_feel > 20),
    alpha = .5
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count)
  ) +
  geom_point(
    aes(color = season),
    alpha = .5
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count,
        color = season)
  ) +
  geom_point(
    alpha = .5
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count,
        color = season)
  ) +
  geom_point(
    alpha = .5
  ) +
  geom_smooth(
    method = "lm"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count,
        color = season)
  ) +
  geom_point(
    alpha = .5
  ) +
  geom_smooth(
    method = "lm"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count)
  ) +
  geom_point(
    aes(color = season),
    alpha = .5
  ) +
  geom_smooth(
    method = "lm"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count)
  ) +
  geom_point(
    aes(color = season),
    alpha = .5
  ) +
  geom_smooth(
    aes(group = day_night),
    method = "lm"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count,
        color = season,
        group = day_night)
  ) +
  geom_point(
    alpha = .5
  ) +
  geom_smooth(
    method = "lm"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count,
        color = season,
        group = day_night)
  ) +
  geom_point(
    alpha = .5
  ) +
  geom_smooth(
    method = "lm",
    color = "black"
  )


## -----------------------------------------------------------------------------
g <-
  ggplot(
    bikes,
    aes(x = temp_feel, y = count,
        color = season,
        group = day_night)
  ) +
  geom_point(
    alpha = .5
  ) +
  geom_smooth(
    method = "lm",
    color = "black"
  )


## -----------------------------------------------------------------------------
class(g)


## -----------------------------------------------------------------------------
g +
  geom_rug(
    alpha = .2
  )


## -----------------------------------------------------------------------------
g +
  geom_rug(
    alpha = .2,
    show.legend = FALSE
  )


## -----------------------------------------------------------------------------
g +
  geom_rug(
    alpha = .2,
    show.legend = FALSE
  ) +
  geom_linerange(
    aes(ymin = 0, ymax = count)
  )


## -----------------------------------------------------------------------------
g +
  labs(
    x = "Feels-like temperature (°C)",
    y = "Reported bike shares",
    title = "TfL bike sharing trends"
  )


## -----------------------------------------------------------------------------
g <- g +
  labs(
    x = "Feels-like temperature (°C)",
    y = "Reported bike shares",
    title = "TfL bike sharing trends",
    color = NULL
  )

g


## -----------------------------------------------------------------------------
g +
  labs(
    subtitle = "Reported bike rents versus feels-like temperature in London",
    caption = "Data: TfL",
    tag = "A)",
    color = "Season:"
  )


## -----------------------------------------------------------------------------
g +
  labs(
    x = "",
    caption = "Data: TfL"
  )


## -----------------------------------------------------------------------------
g +
  labs(
    x = NULL,
    caption = "Data: TfL"
  )


## -----------------------------------------------------------------------------
g + theme_light()


## -----------------------------------------------------------------------------
g + theme_minimal()


## -----------------------------------------------------------------------------
g + theme_light(
  base_size = 14,
  base_family = "Asap Condensed"
)


## -----------------------------------------------------------------------------
theme_set(theme_light())

g


## -----------------------------------------------------------------------------
theme_set(theme_light(
  base_size = 14,
  base_family = "Asap Condensed"
))

g


## -----------------------------------------------------------------------------
# install.packages("systemfonts")
library(systemfonts)

system_fonts() %>%
  filter(stringr::str_detect(family, "Asap")) %>%
  pull(family) %>%
  unique() %>% 
  sort()


## -----------------------------------------------------------------------------
register_variant(
  name = "Cabinet Grotesk Black",
  family = "Cabinet Grotesk",
  weight = "heavy",
  features = font_feature(letters = "stylistic")
)


## -----------------------------------------------------------------------------
g +
  theme_light(
    base_size = 18,
    base_family = "Cabinet Grotesk Black"
  )


## -----------------------------------------------------------------------------
g +
  theme(
    panel.grid.minor = element_blank()
  )


## -----------------------------------------------------------------------------
g +
  theme(
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold")
  )


## -----------------------------------------------------------------------------
g +
  theme(
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold"),
    legend.position = "top"
  )


## -----------------------------------------------------------------------------
g +
  theme(
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold"),
    legend.position = "none"
  )


## -----------------------------------------------------------------------------
g +
  theme(
    panel.grid.minor = element_blank(),
    plot.title = element_text(face = "bold"),
    legend.position = "top",
    plot.title.position = "plot"
  )


## -----------------------------------------------------------------------------
theme_update(
  panel.grid.minor = element_blank(),
  plot.title = element_text(face = "bold"),
  legend.position = "top",
  plot.title.position = "plot"
)

g


## -----------------------------------------------------------------------------
# ggsave(g, filename = "my_plot.png")


## -----------------------------------------------------------------------------
# ggsave("my_plot.png")


## -----------------------------------------------------------------------------
# ggsave("my_plot.png", width = 8, height = 5, dpi = 600)


## -----------------------------------------------------------------------------
# ggsave("my_plot.pdf", width = 20, height = 12, unit = "cm", device = cairo_pdf)


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count,
        color = season)
  ) +
  geom_point() +
  scale_x_continuous() +
  scale_y_continuous() +
  scale_color_discrete()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = season, y = temp_feel)
  ) +
  geom_boxplot() +
  scale_x_discrete() +
  scale_y_continuous()


## -----------------------------------------------------------------------------
g +
  scale_x_continuous() +
  scale_y_continuous() +
  scale_color_discrete()


## -----------------------------------------------------------------------------
g +
  scale_x_binned() +
  scale_y_log10() +
  scale_color_viridis_d()


## -----------------------------------------------------------------------------
g +
  scale_x_continuous(
    expand = c(mult = 0, add = 0)
  ) +
  scale_y_continuous() +
  scale_color_discrete()


## -----------------------------------------------------------------------------
g +
  scale_x_continuous(
    expand = c(mult = 0, add = 0),
    breaks = seq(0, 30, by = 5)
  ) +
  scale_y_continuous() +
  scale_color_discrete()


## -----------------------------------------------------------------------------
g +
  scale_x_continuous(
    expand = c(mult = 0, add = 0),
    breaks = seq(0, 30, by = 5), 
    labels = function(x) paste0(x, "°C")
  ) +
  scale_y_continuous() +
  scale_color_discrete()


## -----------------------------------------------------------------------------
g +
  scale_x_continuous(
    expand = c(mult = 0, add = 0),
    breaks = seq(0, 30, by = 5), 
    labels = function(x) paste0(x, "°C"),
    name = "Feels-like temperature"
  ) +
  scale_y_continuous() +
  scale_color_discrete()


## -----------------------------------------------------------------------------
g +
  scale_x_continuous(
    expand = c(mult = 0, add = 0),
    breaks = seq(0, 30, by = 5), 
    labels = function(x) paste0(x, "°C"),
    name = "Feels-like temperature"
  ) +
  scale_y_continuous(
    limits = c(0, NA)
  ) +
  scale_color_discrete()


## -----------------------------------------------------------------------------
g +
  scale_x_continuous(
    expand = c(mult = 0, add = 0),
    breaks = seq(0, 30, by = 5), 
    labels = function(x) paste0(x, "°C"),
    name = "Feels-like temperature"
  ) +
  scale_y_continuous(
    limits = c(5000, 20000)
  ) +
  scale_color_discrete()


## -----------------------------------------------------------------------------
g +
  scale_x_continuous(
    expand = c(mult = 0, add = 0),
    breaks = seq(0, 30, by = 5), 
    labels = function(x) paste0(x, "°C"),
    name = "Feels-like temperature"
  ) +
  scale_y_continuous(
    breaks = c(100, 10000, 20000, 50000)
  ) +
  scale_color_discrete()


## -----------------------------------------------------------------------------
g +
  scale_x_continuous(
    expand = c(mult = 0, add = 0),
    breaks = seq(0, 30, by = 5), 
    labels = function(x) paste0(x, "°C"),
    name = "Feels-like temperature"
  ) +
  scale_y_continuous(
    breaks = 0:5*10000
  ) +
  scale_color_discrete()


## -----------------------------------------------------------------------------
g +
  scale_x_continuous(
    expand = c(mult = 0, add = 0),
    breaks = seq(0, 30, by = 5), 
    labels = function(x) paste0(x, "°C"),
    name = "Feels-like temperature"
  ) +
  scale_y_continuous(
    breaks = 0:5*10000, 
    labels = scales::label_comma()
  ) +
  scale_color_discrete()


## -----------------------------------------------------------------------------
g +
  scale_x_continuous(
    expand = c(mult = 0, add = 0),
    breaks = seq(0, 30, by = 5), 
    labels = function(x) paste0(x, "°C"),
    name = "Feels-like temperature"
  ) +
  scale_y_continuous( 
    breaks = 0:5*10000, 
    labels = scales::label_comma()
  ) +
  scale_color_discrete(
    type = c("#3c89d9", "#1ec99b", "#f7b01b", "#a26e7c")
  )


## -----------------------------------------------------------------------------
g +
  scale_x_continuous(
    expand = c(mult = 0, add = 0),
    breaks = seq(0, 30, by = 5), 
    labels = function(x) paste0(x, "°C"),
    name = "Feels-like temperature"
  ) +
  scale_y_continuous(
    breaks = 0:5*10000, 
    labels = scales::label_comma()
  ) +
  scale_color_manual(
    values = c("#3c89d9", "#1ec99b", "#f7b01b", "#a26e7c")
  )


## -----------------------------------------------------------------------------
colors_sorted <- c(
  autumn = "#a26e7c",
  spring = "#1ec99b",
  summer = "#f7b01b",
  winter = "#3c89d9"
)

g +
  scale_x_continuous(
    expand = c(mult = 0, add = 0),
    breaks = seq(0, 30, by = 5), 
    labels = function(x) paste0(x, "°C"),
    name = "Feels-like temperature"
  ) +
  scale_y_continuous(
    breaks = 0:5*10000, 
    labels = scales::label_comma()
  ) +
  scale_color_manual(
    values = colors_sorted
  )


## -----------------------------------------------------------------------------
g +
  scale_x_continuous(
    expand = c(mult = 0, add = 0),
    breaks = seq(0, 30, by = 5), 
    labels = function(x) paste0(x, "°C"),
    name = "Feels-like temperature"
  ) +
  scale_y_continuous(
    breaks = 0:5*10000, 
    labels = scales::label_comma()
  ) +
  scale_color_brewer(
    palette = "Dark2"
  )


## -----------------------------------------------------------------------------
RColorBrewer::display.brewer.all()


## -----------------------------------------------------------------------------
RColorBrewer::display.brewer.all(colorblindFriendly = TRUE)


## -----------------------------------------------------------------------------
# install.packages("rcartocolor")
rcartocolor::display_carto_all()


## -----------------------------------------------------------------------------
# install.packages("rcartocolor")
rcartocolor::display_carto_all(colorblind_friendly = TRUE)


## -----------------------------------------------------------------------------
g +
  scale_x_continuous(
    expand = c(mult = 0.02, add = 0),
    breaks = seq(0, 30, by = 5), 
    labels = function(x) paste0(x, "°C"),
    name = "Feels-like temperature"
  ) +
  scale_y_continuous(
    expand = c(mult = 0, add = 1500), 
    breaks = 0:5*10000, 
    labels = scales::label_comma()
  ) +
  rcartocolor::scale_color_carto_d(
    palette = "Bold"
  )


## -----------------------------------------------------------------------------
# install.packages("scico")
scico::scico_palette_show()


## -----------------------------------------------------------------------------
g +
  scale_x_continuous(
    expand = c(mult = 0.02, add = 0),
    breaks = seq(0, 30, by = 5), 
    labels = function(x) paste0(x, "°C"),
    name = "Feels-like temperature"
  ) +
  scale_y_continuous(
    expand = c(mult = 0, add = 1500), 
    breaks = 0:5*10000, 
    labels = scales::label_comma()
  ) +
  scico::scale_color_scico_d(
    palette = "hawaii"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count,
        color = humidity)
  ) +
  geom_point(alpha = .7) +
  scico::scale_color_scico(
    palette = "davos",
    direction = -1,
    end = .8
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count,
        color = humidity)
  ) +
  geom_point(alpha = .7) +
  scale_color_viridis_c(
    direction = -1
  )


## -----------------------------------------------------------------------------
g +
  scale_x_continuous(
    expand = c(mult = 0, add = 0),
    breaks = seq(0, 30, by = 5), 
    labels = function(x) paste0(x, "°C"),
    name = "Feels-like temperature"
  ) +
  scale_y_continuous( 
    breaks = 0:5*10000, 
    labels = scales::label_comma()
  ) +
  scale_color_manual(
    values = colors_sorted,
    name = NULL
  )


## -----------------------------------------------------------------------------
g +
  scale_x_continuous(
    expand = c(mult = 0, add = 0),
    breaks = seq(0, 30, by = 5), 
    labels = function(x) paste0(x, "°C"),
    name = "Feels-like temperature"
  ) +
  scale_y_continuous(
    breaks = 0:5*10000, 
    labels = scales::label_comma()
  ) +
  scale_color_manual(
    values = colors_sorted,
    name = NULL,
    labels = stringr::str_to_title
  )


## -----------------------------------------------------------------------------
g +
  facet_wrap(
    vars(day_night)
  )


## -----------------------------------------------------------------------------
g +
  facet_wrap(
    ~ day_night
  )


## -----------------------------------------------------------------------------
g +
  facet_wrap(
    ~ is_workday + day_night
  )


## -----------------------------------------------------------------------------
g +
  facet_grid(
    rows = vars(day_night),
    cols = vars(is_workday)
  )


## -----------------------------------------------------------------------------
g +
  facet_grid(
    day_night ~ is_workday
  )


## -----------------------------------------------------------------------------
g +
  facet_grid(
    day_night ~ is_workday + season
  )


## -----------------------------------------------------------------------------
g +
  facet_grid(
    day_night ~ is_workday,
    scales = "free"
  )


## -----------------------------------------------------------------------------
g +
  facet_grid(
    day_night ~ is_workday,
    scales = "free",
    space = "free"
  )


## -----------------------------------------------------------------------------
g +
  facet_grid(
    day_night ~ is_workday,
    scales = "free_y",
    space = "free_y"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = season, y = count)
  ) +
  geom_boxplot() +
  coord_cartesian()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = season, y = count)
  ) +
  geom_boxplot() +
  coord_cartesian(
    ylim = c(NA, 15000)
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = season, y = count)
  ) +
  geom_boxplot() +
  coord_cartesian(
    ylim = c(NA, 15000)
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = season, y = count)
  ) +
  geom_boxplot() +
  scale_y_continuous(
    limits = c(NA, 15000)
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = season, y = count)
  ) +
  geom_boxplot() +
  coord_cartesian(
    ylim = c(NA, 15000),
    clip = "off"
  ) +
  theme(plot.margin = margin(300, 5, 5, 5))


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = count)
  ) +
  geom_point() +
  coord_cartesian(
    expand = FALSE,
    clip = "off"
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = temp)
  ) +
  geom_point() +
  coord_fixed()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = temp_feel, y = temp)
  ) +
  geom_point() +
  coord_fixed(ratio = 4)


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = weather_type)
  ) +
  geom_bar() +
  coord_cartesian()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = weather_type)
  ) +
  geom_bar() +
  coord_flip()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(y = weather_type)
  ) +
  geom_bar() +
  coord_cartesian()


## -----------------------------------------------------------------------------
ggplot(
    bikes,
    aes(x = weather_type)
  ) +
  geom_bar() +
  coord_flip()


## -----------------------------------------------------------------------------
library(forcats)

ggplot(
    filter(bikes, !is.na(weather_type)),
    aes(y = fct_infreq(weather_type))
  ) +
  geom_bar()


## -----------------------------------------------------------------------------
library(forcats)

ggplot(
    filter(bikes, !is.na(weather_type)),
    aes(y = fct_rev(
      fct_infreq(weather_type)
    ))
  ) +
  geom_bar()


## -----------------------------------------------------------------------------
theme_set(theme_grey(base_size = 15, base_line_size = .5))


## -----------------------------------------------------------------------------
g1 <- 
  ## create scatter plot, encoded based on season
  ggplot(bikes, aes(temp_feel, count)) +
  geom_point(
    aes(color = season),
    size = 2.2, alpha = .55
  ) 

g1


## -----------------------------------------------------------------------------
g2 <- g1 +
  ## add a linear fitting for each time of the day
  geom_smooth(
    aes(group = day_night),
    method = "lm", color = "black"
  )

g2


## -----------------------------------------------------------------------------
g3 <- g2 +
  ## add titles + labels
  labs(
    x = "Feels-Like Temperature", y = NULL,
    caption = "Data: Transport for London (TfL), Jan 2015—Dec 2016",
    title = "Reported TfL bike rents versus feels-like temperature in London, 2015–2016"
  )

g3


## -----------------------------------------------------------------------------
g4 <- g3 + 
  theme_light(base_size = 18, base_family = "Spline Sans")

g4


## -----------------------------------------------------------------------------
codes <- c(
  workday = "Workday",
  weekend_or_holiday = "Weekend or Holiday"
)

g5 <- g4 +
  facet_grid(
    day_night ~ is_workday,
    scales = "free_y", space = "free_y",
    labeller = labeller(
      day_night = stringr::str_to_title,
      is_workday = codes
    )
  )

g5


## -----------------------------------------------------------------------------
g6 <- g5  +
  ## adjust labels x-axis
  scale_x_continuous(
    expand = c(mult = 0, add = 1),
    breaks = 0:6*5, labels = function(x) paste0(x, "°C")
  ) +
  ## adjust labels y-axis
  scale_y_continuous(
    expand = c(mult = .05, add = 0),limits = c(0, NA),
    breaks = 0:5*10000, labels = scales::label_comma()
  ) +
  ## modify colors + legend
  scale_color_manual(
    values = c("#3c89d9", "#1ec99b", "#F7B01B", "#a26e7c"), name = NULL,
    breaks = stringr::str_to_title,
    guide = guide_legend(override.aes = list(size = 5))
  ) 

g6


## -----------------------------------------------------------------------------
g6 + 
  ## theme modifications
  theme(
    plot.title.position = "plot",
    plot.caption.position = "plot",
    plot.title = element_text(face = "bold", size = rel(1.5)),
    axis.text = element_text(family = "Spline Sans Mono", color = "grey45"),
    axis.title.x = element_text(hjust = 0, margin = margin(t = 12), color = "grey25"),
    strip.text = element_text(face = "bold", size = rel(1.1)),
    panel.grid.major.x = element_blank(),
    panel.grid.minor = element_blank(),
    legend.position = "top"
  )



# APPENDIX: Statisticaal Layers ################################################


## -----------------------------------------------------------------------------
theme_set(theme_light(
  base_size = 14,
  base_family = "Asap Condensed"
))


## -----------------------------------------------------------------------------
ggplot(bikes, aes(x = temp_feel, y = count)) +
  geom_smooth(stat = "smooth")


## -----------------------------------------------------------------------------
ggplot(bikes, aes(x = temp_feel, y = count)) +
  stat_smooth(geom = "smooth")


## -----------------------------------------------------------------------------
ggplot(bikes, aes(x = date, y = temp_feel)) +
  geom_point(stat = "identity")


## -----------------------------------------------------------------------------
ggplot(bikes, aes(x = date, y = temp_feel)) +
  stat_identity(geom = "point")


## -----------------------------------------------------------------------------
ggplot(bikes, aes(x = is_weekend)) +
  geom_bar(stat = "count")


## -----------------------------------------------------------------------------
ggplot(bikes, aes(x = is_weekend)) +
  stat_count(geom = "bar")


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = season, y = temp_feel)
  ) +
  stat_summary() 


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = season, y = temp_feel)
  ) +
  stat_summary(
    fun.data = mean_se, ## the default
    geom = "pointrange"  ## the default
  ) 


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = season, y = temp_feel)
  ) +
  geom_boxplot() +
  stat_summary(
    fun = mean,
    geom = "point",
    color = "#28a87d",
    size = 3
  ) 


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = season, y = temp_feel)
  ) +
  stat_summary() +
  stat_summary(
    fun = mean,
    geom = "text",
    aes(label = after_stat(y))
  )


## -----------------------------------------------------------------------------
ggplot(
    bikes, 
    aes(x = season, y = temp_feel)
  ) +
  stat_summary() +
  stat_summary(
    fun = mean,
    geom = "text",
    aes(label = after_stat(
      paste0(round(y, 2), "°C"))
    ),
    hjust = -.2,
    size = 3.5
  )


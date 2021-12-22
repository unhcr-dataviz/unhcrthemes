library(colorspace)
library(usethis)

main_blue <- "#0072BC"
main_navy <- "#18375F"
main_green <- "#00B398"
main_red <- "#EF4A60"
main_grey <- "#666666"
main_yellow <- "#FAEB00"
alt_yellow <- "#BB9D21"

pal_blue_unhcr <- c(
  "blue1" = colorspace::lighten(main_blue, 0.85),
  "blue2" = colorspace::lighten(main_blue, 0.55),
  "blue3" = colorspace::lighten(main_blue, 0.3),
  "blue4" = main_blue,
  "blue5" = colorspace::darken(main_blue, 0.3)
)

pal_navy_unhcr <- c(
  "navy1" = colorspace::lighten(main_navy, 0.9),
  "navy2" = colorspace::lighten(main_navy, 0.75),
  "navy3" = colorspace::lighten(main_navy, 0.5),
  "navy4" = colorspace::lighten(main_navy, 0.25),
  "navy5" = main_navy
)

pal_green_unhcr <- c(
  "green1" = colorspace::lighten(main_green, 0.9),
  "green2" = colorspace::lighten(main_green, 0.55),
  "green3" = colorspace::lighten(main_green, 0.3),
  "green4" = main_green,
  "green5" = colorspace::darken(main_green, 0.3)
)

pal_red_unhcr <- c(
  "red1" = colorspace::lighten(main_red, 0.85),
  "red2" = colorspace::lighten(main_red, 0.6),
  "red3" = colorspace::lighten(main_red, 0.3),
  "red4" = main_red,
  "red5" = colorspace::darken(main_red, 0.3)
)

pal_grey_unhcr <- c(
  "grey1" = "#E6E6E6",
  "grey2" = "#CCCCCC",
  "grey3" = "#999999",
  "grey4" = main_grey,
  "grey5" = "#333333"
)

pal_yellow_unhcr <- c(
  "yellow1" = colorspace::lighten(main_yellow, 0.7),
  "yellow2" = colorspace::lighten(main_yellow, 0.4),
  "yellow3" = main_yellow,
  "yellow4" = hex(colorspace::mixcolor(0.4,
                                       hex2RGB(main_yellow),
                                       hex2RGB(alt_yellow))),
  "yellow5" = alt_yellow
)

pal_main <- c(pal_blue_unhcr["blue4"], pal_blue_unhcr["blue2"],
              pal_navy_unhcr["navy5"], pal_navy_unhcr["navy3"],
              pal_green_unhcr["green4"], pal_green_unhcr["green2"],
              pal_grey_unhcr["grey4"], pal_grey_unhcr["grey2"],
              pal_red_unhcr["red4"], pal_red_unhcr["red2"])

pal_poc <- c(
  "REF" = main_blue,
  "UNRWA" = pal_blue_unhcr["blue2"],
  "ASY" = main_navy,
  "IDP" = main_green,
  "STA" = pal_yellow_unhcr["yellow4"],
  "RET" = pal_navy_unhcr["navy3"],
  "RETIDP" = pal_navy_unhcr["navy2"],
  "OOC" = pal_grey_unhcr["grey3"],
  "VDA" = main_red
)

unhcrcolors <- tibble::tibble(name = c("pal_unhcr",
                                       "pal_unhcr_poc",
                                       "pal_unhcr_region",
                                       "pal_blue",
                                       "pal_navy",
                                       "pal_green",
                                       "pal_red",
                                       "pal_yellow",
                                       "pal_grey",
                                       "pal_blue_red",
                                       "pal_navy_red"),
                              type = c(rep("qualitative", 3),
                                       rep("sequential", 6),
                                       rep("diverging", 2)),
                              min_n = 1,
                              max_n = c(c(10, 9, 7),
                                        rep(5, 6),
                                        rep(9, 2)),
                              n1 = list(pal_main[1],
                                        pal_poc[1],
                                        pal_blue_unhcr[4],
                                        pal_blue_unhcr[4],
                                        pal_navy_unhcr[5],
                                        pal_green_unhcr[4],
                                        pal_red_unhcr[4],
                                        pal_yellow_unhcr[3],
                                        pal_grey_unhcr[4],
                                        NULL, NULL),
                              n2 = list(pal_main[1:2],
                                        c(pal_poc[1], pal_poc[3]),
                                        pal_blue_unhcr[4:3],
                                        c(pal_blue_unhcr[2], pal_blue_unhcr[4]),
                                        c(pal_navy_unhcr[3], pal_navy_unhcr[5]),
                                        c(pal_green_unhcr[2], pal_green_unhcr[4]),
                                        c(pal_red_unhcr[2], pal_red_unhcr[4]),
                                        c(pal_yellow_unhcr[3], pal_yellow_unhcr[4]),
                                        c(pal_grey_unhcr[2], pal_grey_unhcr[4]),
                                        c(pal_blue_unhcr[4], pal_red_unhcr[4]),
                                        c(pal_navy_unhcr[5], pal_red_unhcr[4])),
                              n3 = list(c(pal_main[3], pal_main[1:2]),
                                        c(pal_poc[1], pal_poc[3:4]),
                                        pal_blue_unhcr[4:2],
                                        pal_blue_unhcr[2:4],
                                        pal_navy_unhcr[3:5],
                                        pal_green_unhcr[2:4],
                                        pal_red_unhcr[2:4],
                                        pal_yellow_unhcr[3:5],
                                        pal_grey_unhcr[2:4],
                                        c(pal_blue_unhcr[4], pal_grey_unhcr[1], pal_red_unhcr[4]),
                                        c(pal_navy_unhcr[5], pal_grey_unhcr[1], pal_red_unhcr[4])),
                              n4 = list(c(pal_main[3], pal_main[1:2], pal_main[5]),
                                        c(pal_poc[1], pal_poc[3:5]),
                                        c(pal_blue_unhcr[4:2], pal_navy_unhcr[5]),
                                        pal_blue_unhcr[2:5],
                                        pal_navy_unhcr[2:5],
                                        pal_green_unhcr[2:5],
                                        pal_red_unhcr[2:5],
                                        pal_yellow_unhcr[2:5],
                                        pal_grey_unhcr[2:5],
                                        c(pal_blue_unhcr[4], pal_blue_unhcr[2],
                                          pal_red_unhcr[2], pal_red_unhcr[4]),
                                        c(pal_navy_unhcr[5], pal_navy_unhcr[3],
                                          pal_red_unhcr[2], pal_red_unhcr[4])),
                              n5 = list(c(pal_main[3], pal_main[1:2], pal_main[5], pal_main[7]),
                                        c(pal_poc[1], pal_poc[3:6]),
                                        c(pal_blue_unhcr[4:2], pal_navy_unhcr[5], pal_green_unhcr[4]),
                                        pal_blue_unhcr[1:5],
                                        pal_navy_unhcr[1:5],
                                        pal_green_unhcr[1:5],
                                        pal_red_unhcr[1:5],
                                        pal_yellow_unhcr[1:5],
                                        pal_grey_unhcr[1:5],
                                        c(pal_blue_unhcr[4], pal_blue_unhcr[2],
                                          pal_grey_unhcr[1],
                                          pal_red_unhcr[2], pal_red_unhcr[4]),
                                        c(pal_navy_unhcr[5], pal_navy_unhcr[3],
                                          pal_grey_unhcr[1],
                                          pal_red_unhcr[2], pal_red_unhcr[4])),
                              n6 = list(c(pal_main[1:5], pal_main[7]),
                                        c(pal_poc[1], pal_poc[3:6], pal_poc[8]),
                                        c(pal_blue_unhcr[4:2], pal_navy_unhcr[5], pal_green_unhcr[4],
                                          pal_yellow_unhcr[4]),
                                        NULL, NULL, NULL,
                                        NULL, NULL, NULL,
                                        c(pal_blue_unhcr[4:2],  pal_red_unhcr[2:4]),
                                        c(pal_navy_unhcr[5:3], pal_red_unhcr[2:4])),
                              n7 = list(pal_main[1:7],
                                        c(pal_poc[1], pal_poc[3:6], pal_poc[8:9]),
                                        c(pal_blue_unhcr[4:2], pal_navy_unhcr[5], pal_green_unhcr[4],
                                          pal_yellow_unhcr[4], pal_red_unhcr[4]),
                                        NULL, NULL, NULL,
                                        NULL, NULL, NULL,
                                        c(pal_blue_unhcr[4:2],  pal_grey_unhcr[1], pal_red_unhcr[2:4]),
                                        c(pal_navy_unhcr[5:3], pal_grey_unhcr[1], pal_red_unhcr[2:4])),
                              n8 = list(pal_main[1:8],
                                        c(pal_poc[1:6], pal_poc[8:9]),
                                        NULL,
                                        NULL, NULL, NULL,
                                        NULL, NULL, NULL,
                                        c(pal_blue_unhcr[5:2], pal_red_unhcr[2:5]),
                                        c(pal_navy_unhcr[5:2], pal_red_unhcr[2:5])),
                              n9 = list(pal_main[1:9],
                                        pal_poc,
                                        NULL,
                                        NULL, NULL, NULL,
                                        NULL, NULL, NULL,
                                        c(pal_blue_unhcr[5:2], pal_grey_unhcr[1], pal_red_unhcr[2:5]),
                                        c(pal_navy_unhcr[5:2], pal_grey_unhcr[1], pal_red_unhcr[2:5])),
                              n10 = list(pal_main,
                                         NULL, NULL,
                                         NULL, NULL, NULL,
                                         NULL, NULL, NULL,
                                         NULL, NULL))


unhcrcolors <- as.data.frame(unhcrcolors)

usethis::use_data(unhcrcolors,
                  internal = TRUE,
                  overwrite = TRUE)

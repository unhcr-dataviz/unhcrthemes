library(colorspace)
library(usethis)


main_navy <- "#18375F"

pal_blue_unhcr <- c(
  'blue01' = '#cde3f1',
  'blue02' = '#8fc1e1',
  'blue03' = '#4f9ed0',
  'blue04' = '#0072bc',
  'blue05' = '#05568b',
  'blue06' = '#0b3754'
)

pal_yellow_unhcr <- c(
  'yellow01' = '#fef1d1',
  'yellow02' = '#ffc740',
  'yellow03' = '#e4a202',
  'yellow04' = '#b98405',
  'yellow05' = '#8f6808',
  'yellow06' = '#684d0b'
)

pal_green_unhcr <- c(
  'green01' = '#daf6eb',
  'green02' = '#7de0b9',
  'green03' = '#32c189',
  'green04' = '#2b9c70',
  'green05' = '#257958',
  'green06' = '#1f5741'
)

pal_cyan_unhcr <- c(
  'cyan01' = '#d4f3fe',
  'cyan02' = '#6cd8fd',
  'cyan03' = '#01b6f2',
  'cyan04' = '#0493c2',
  'cyan05' = '#087295',
  'cyan06' = '#0b5269'
)

pal_red_unhcr <- c(
  'red01' = '#fce2de',
  'red02' = '#f9b3a7',
  'red03' = '#f67f6a',
  'red04' = '#d25a45',
  'red05' = '#9c4637',
  'red06' = '#683229'
)

pal_purple_unhcr <- c(
  'purple01' = '#e7e5f7',
  'purple02' = '#c3beed',
  'purple03' = '#a097e3',
  'purple04' = '#7e74c2',
  'purple05' = '#5e578e',
  'purple06' = '#403c5d'
)

pal_brown_unhcr <- c(
  'brown01' = '#ead9d8',
  'brown02' = '#d3afab',
  'brown03' = '#bc8580',
  'brown04' = '#a65b54',
  'brown05' = '#7c3c36',
  'brown06' = '#482724'
)

pal_grey_unhcr <- c(
  'grey01' = '#e5e5e5',
  'grey02' = '#bfbfbf',
  'grey03' = '#999999',
  'grey04' = '#737373',
  'grey05' = '#4d4d4d',
  'grey06' = '#262626'
)

pal_navy_unhcr <- c(
  "navy01" = colorspace::lighten(main_navy, 0.9),
  "navy02" = colorspace::lighten(main_navy, 0.75),
  "navy03" = colorspace::lighten(main_navy, 0.5),
  "navy04" = colorspace::lighten(main_navy, 0.25),
  "navy05" = main_navy
)

pal_main <- c(
  pal_blue_unhcr["blue04"],
  pal_yellow_unhcr["yellow02"],
  pal_green_unhcr["green03"],
  pal_cyan_unhcr["cyan02"],
  pal_red_unhcr["red04"],
  pal_purple_unhcr["purple03"],
  pal_brown_unhcr["brown05"],
  pal_grey_unhcr["grey02"]
)

pal_poc <- c(
  "REF" = pal_blue_unhcr["blue04"],
  #"UNRWA" = pal_purple_unhcr["purple03"],
  "ASY" = pal_cyan_unhcr["cyan02"],
  "IDP" = pal_green_unhcr["green03"],
  "STA" = pal_yellow_unhcr["yellow02"],
  "RET" = pal_purple_unhcr["purple03"],
  #"RETIDP" = pal_purple_unhcr["purple03"],
  "OIP" = pal_red_unhcr["red04"],
  "OOC" = pal_grey_unhcr["grey02"]
)

pal_bluegreen_unhcr <- c(
  'blue-green01' = '#daf6eb',
  'blue-green02' = '#9acfdd',
  'blue-green03' = '#59a8cf',
  'blue-green04' = '#167fc1',
  'blue-green05' = '#055990',
  'blue-green06' = '#0b3754'
)

pal_purpleblue_unhcr <- c(
  'purple-blue01' = '#cde3f1',
  'purple-blue02' = '#9ec1e1',
  'purple-blue03' = '#7c9ece',
  'purple-blue04' = '#677ab2',
  'purple-blue05' = '#56598b',
  'purple-blue06' = '#403c5d'
)

pal_redyellow_unhcr <- c(
  'red-yellow01' = '#fef1d1',
  'red-yellow02' = '#f8c27a',
  'red-yellow03' = '#e19656',
  'red-yellow04' = '#c06e43',
  'red-yellow05' = '#984c36',
  'red-yellow06' = '#683229'
)


unhcrcolors <- tibble::tibble(
  name = c(
    "pal_unhcr",
    "pal_unhcr_poc",
    "pal_unhcr_region",
    "pal_blue",
    "pal_yellow",
    "pal_green",
    "pal_cyan",
    "pal_red",
    "pal_purple",
    "pal_brown",
    "pal_grey",
    "pal_bluegreen",
    "pal_purpleblue",
    "pal_redyellow",
    "pal_navy",
    "pal_blue_yellow",
    "pal_blue_brown",
    "pal_green_purple",
    "pal_blue_red",
    "pal_navy_red"
  ),
  type = c(rep("qualitative", 3), rep("sequential", 12), rep("diverging", 5)),
  min_n = 1,
  max_n = c(c(8, 7), rep(6, 12), 1, rep(9, 5)),
  n1 = list(
    pal_main[1],
    pal_poc[1],
    pal_main[1],
    pal_blue_unhcr[4],
    pal_yellow_unhcr[2],
    pal_green_unhcr[3],
    pal_cyan_unhcr[2],
    pal_red_unhcr[4],
    pal_purple_unhcr[3],
    pal_brown_unhcr[5],
    pal_grey_unhcr[2],
    pal_bluegreen_unhcr[4],
    pal_purpleblue_unhcr[4],
    pal_redyellow_unhcr[4],
    pal_navy_unhcr[5],
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  ),
  n2 = list(
    pal_main[1:2],
    pal_poc[1:2],
    c(pal_main[1], pal_main[4]),
    c(pal_blue_unhcr[2], pal_blue_unhcr[4]),
    c(pal_yellow_unhcr[2], pal_yellow_unhcr[4]),
    c(pal_green_unhcr[3], pal_green_unhcr[5]),
    c(pal_cyan_unhcr[2], pal_cyan_unhcr[4]),
    c(pal_red_unhcr[2], pal_red_unhcr[4]),
    c(pal_purple_unhcr[3], pal_purple_unhcr[5]),
    c(pal_brown_unhcr[3], pal_brown_unhcr[5]),
    c(pal_grey_unhcr[2], pal_grey_unhcr[4]),
    c(pal_bluegreen_unhcr[2], pal_bluegreen_unhcr[4]),
    c(pal_purpleblue_unhcr[2], pal_purpleblue_unhcr[4]),
    c(pal_redyellow_unhcr[2], pal_redyellow_unhcr[4]),
    c(pal_navy_unhcr[3], pal_navy_unhcr[5]),
    c(pal_blue_unhcr[2], pal_yellow_unhcr[2]),
    c(pal_blue_unhcr[4], pal_brown_unhcr[4]),
    c(pal_green_unhcr[3], pal_purple_unhcr[3]),
    c(pal_blue_unhcr[4], pal_red_unhcr[4]),
    c(pal_navy_unhcr[5], pal_red_unhcr[4])
  ),
  n3 = list(
    pal_main[1:3],
    pal_poc[1:3],
    c(pal_main[1], pal_main[4], pal_main[6]),
    c(pal_blue_unhcr[2], pal_blue_unhcr[4], pal_blue_unhcr[6]),
    c(pal_yellow_unhcr[2], pal_yellow_unhcr[4], pal_yellow_unhcr[6]),
    c(pal_green_unhcr[1], pal_green_unhcr[3], pal_green_unhcr[5]),
    c(pal_cyan_unhcr[2], pal_cyan_unhcr[4], pal_cyan_unhcr[6]),
    c(pal_red_unhcr[2], pal_red_unhcr[4], pal_red_unhcr[6]),
    c(pal_purple_unhcr[1], pal_purple_unhcr[3], pal_purple_unhcr[5]),
    c(pal_brown_unhcr[1], pal_brown_unhcr[3], pal_brown_unhcr[5]),
    c(pal_grey_unhcr[2], pal_grey_unhcr[4], pal_grey_unhcr[6]),
    c(pal_bluegreen_unhcr[2], pal_bluegreen_unhcr[4], pal_bluegreen_unhcr[6]),
    c(
      pal_purpleblue_unhcr[2],
      pal_purpleblue_unhcr[4],
      pal_purpleblue_unhcr[6]
    ),
    c(pal_redyellow_unhcr[2], pal_redyellow_unhcr[4], pal_redyellow_unhcr[6]),
    pal_navy_unhcr[3:5],
    c(pal_blue_unhcr[2], "#f5f5f5", pal_yellow_unhcr[2]),
    c(pal_blue_unhcr[4], "#f5f5f5", pal_brown_unhcr[4]),
    c(pal_green_unhcr[3], "#f5f5f5", pal_purple_unhcr[3]),
    c(pal_blue_unhcr[4], "#E6E6E6", pal_red_unhcr[4]),
    c(pal_navy_unhcr[5], "#E6E6E6", pal_red_unhcr[4])
  ),
  n4 = list(
    pal_main[1:4],
    pal_poc[1:4],
    c(pal_main[1], pal_main[4], pal_main[6], pal_main[3]),
    pal_blue_unhcr[1:4],
    pal_yellow_unhcr[1:4],
    pal_green_unhcr[1:4],
    pal_cyan_unhcr[1:4],
    pal_red_unhcr[1:4],
    pal_purple_unhcr[1:4],
    pal_brown_unhcr[2:5],
    pal_grey_unhcr[1:4],
    pal_bluegreen_unhcr[1:4],
    pal_purpleblue_unhcr[1:4],
    pal_redyellow_unhcr[1:4],
    pal_navy_unhcr[2:5],
    c(
      pal_blue_unhcr[4],
      pal_blue_unhcr[2],
      pal_yellow_unhcr[2],
      pal_yellow_unhcr[4]
    ),
    c(
      pal_blue_unhcr[4],
      pal_blue_unhcr[1],
      pal_brown_unhcr[1],
      pal_brown_unhcr[4]
    ),
    c(
      pal_green_unhcr[6],
      pal_green_unhcr[3],
      pal_purple_unhcr[3],
      pal_purple_unhcr[6]
    ),
    c(pal_blue_unhcr[4], pal_blue_unhcr[2], pal_red_unhcr[2], pal_red_unhcr[4]),
    c(pal_navy_unhcr[5], pal_navy_unhcr[3], pal_red_unhcr[2], pal_red_unhcr[4])
  ),
  n5 = list(
    pal_main[1:5],
    pal_poc[1:5],
    c(pal_main[1], pal_main[4], pal_main[6], pal_main[3], pal_main[2]),
    pal_blue_unhcr[1:5],
    pal_yellow_unhcr[1:5],
    pal_green_unhcr[1:5],
    pal_cyan_unhcr[1:5],
    pal_red_unhcr[1:5],
    pal_purple_unhcr[1:5],
    pal_brown_unhcr[1:5],
    pal_grey_unhcr[1:5],
    pal_bluegreen_unhcr[1:5],
    pal_purpleblue_unhcr[1:5],
    pal_redyellow_unhcr[1:5],
    pal_navy_unhcr[1:5],
    c(
      pal_blue_unhcr[4],
      pal_blue_unhcr[2],
      "#f5f5f5",
      pal_yellow_unhcr[2],
      pal_yellow_unhcr[4]
    ),
    c(
      pal_blue_unhcr[4],
      pal_blue_unhcr[1],
      "#f5f5f5",
      pal_brown_unhcr[1],
      pal_brown_unhcr[4]
    ),
    c(
      pal_green_unhcr[6],
      pal_green_unhcr[3],
      "#f5f5f5",
      pal_purple_unhcr[3],
      pal_purple_unhcr[6]
    ),
    c(
      pal_blue_unhcr[4],
      pal_blue_unhcr[2],
      "#E6E6E6",
      pal_red_unhcr[2],
      pal_red_unhcr[4]
    ),
    c(
      pal_navy_unhcr[5],
      pal_navy_unhcr[3],
      "#E6E6E6",
      pal_red_unhcr[2],
      pal_red_unhcr[4]
    )
  ),
  n6 = list(
    pal_main[1:6],
    pal_poc[1:6],
    c(
      pal_main[1],
      pal_main[4],
      pal_main[6],
      pal_main[3],
      pal_main[2],
      pal_main[5]
    ),
    pal_blue_unhcr[1:6],
    pal_yellow_unhcr[1:6],
    pal_green_unhcr[1:6],
    pal_cyan_unhcr[1:6],
    pal_red_unhcr[1:6],
    pal_purple_unhcr[1:6],
    pal_brown_unhcr[1:6],
    pal_grey_unhcr[1:6],
    pal_bluegreen_unhcr[1:6],
    pal_purpleblue_unhcr[1:6],
    pal_redyellow_unhcr[1:6],
    NULL,
    c(
      pal_blue_unhcr[4],
      pal_blue_unhcr[2],
      pal_blue_unhcr[1],
      pal_yellow_unhcr[1],
      pal_yellow_unhcr[2],
      pal_yellow_unhcr[4]
    ),
    c(
      pal_blue_unhcr[4],
      pal_blue_unhcr[3],
      pal_blue_unhcr[1],
      pal_brown_unhcr[1],
      pal_brown_unhcr[3],
      pal_brown_unhcr[4]
    ),
    c(
      pal_green_unhcr[6],
      pal_green_unhcr[3],
      pal_green_unhcr[1],
      pal_purple_unhcr[1],
      pal_purple_unhcr[3],
      pal_purple_unhcr[6]
    ),
    c(pal_blue_unhcr[4:2], pal_red_unhcr[2:4]),
    c(pal_navy_unhcr[5:3], pal_red_unhcr[2:4])
  ),
  n7 = list(
    pal_main[1:7],
    pal_poc[1:7],
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    c(
      pal_blue_unhcr[4],
      pal_blue_unhcr[2],
      pal_blue_unhcr[1],
      "#f5f5f5",
      pal_yellow_unhcr[1],
      pal_yellow_unhcr[2],
      pal_yellow_unhcr[4]
    ),
    c(
      pal_blue_unhcr[4],
      pal_blue_unhcr[3],
      pal_blue_unhcr[1],
      "#f5f5f5",
      pal_brown_unhcr[1],
      pal_brown_unhcr[3],
      pal_brown_unhcr[4]
    ),
    c(
      pal_green_unhcr[6],
      pal_green_unhcr[3],
      pal_green_unhcr[1],
      "#f5f5f5",
      pal_purple_unhcr[1],
      pal_purple_unhcr[3],
      pal_purple_unhcr[6]
    ),
    c(pal_blue_unhcr[4:2], "#E6E6E6", pal_red_unhcr[2:4]),
    c(pal_navy_unhcr[5:3], "#E6E6E6", pal_red_unhcr[2:4])
  ),
  n8 = list(
    pal_main[1:8],
    c(pal_poc[1:6], pal_poc[8:9]),
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    c(pal_blue_unhcr[5:2], pal_red_unhcr[2:5]),
    c(pal_navy_unhcr[5:2], pal_red_unhcr[2:5])
  ),
  n9 = list(
    pal_main[1:9],
    pal_poc,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    c(pal_blue_unhcr[5:2], pal_grey_unhcr[1], pal_red_unhcr[2:5]),
    c(pal_navy_unhcr[5:2], pal_grey_unhcr[1], pal_red_unhcr[2:5])
  ),
  n10 = list(
    pal_main,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL,
    NULL
  )
)


unhcrcolors <- as.data.frame(unhcrcolors)

usethis::use_data(unhcrcolors, internal = TRUE, overwrite = TRUE)

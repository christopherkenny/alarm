#' Add ALARM Project logo to a ggplot2 object
#'
#' @param gg a ggplot2 object
#' @param logo_left relative position for logo from the left
#' @param logo_bottom relative position for logo from the bottom
#' @param logo_right relative position for logo from the right
#' @param logo_top relative position for logo from the top
#' @param band logical, default `TRUE`. Should the logo be placed on a blue band?
#'
#' @return a ggplot2 object
#' @export
#'
#' @examples
#' p <- ggplot2::mpg |>
#'   ggplot2::ggplot() +
#'   ggplot2::geom_point(ggplot2::aes(displ, hwy, color = class)) +
#'   scale_color_alarm() +
#'   theme_alarm_dark()
#'
#' p |> gg_annotate_alarm()
gg_annotate_alarm <- function(gg, logo_left = .9, logo_bottom = 0.01,
                              logo_right = .99, logo_top = 0.1, band = TRUE) {
  if (!requireNamespace('magick', quietly = TRUE)) {
    stop('Please install the magick package to use this function')
  }
  if (!requireNamespace('patchwork', quietly = TRUE)) {
    stop('Please install the patchwork package to use this function')
  }
  logo <- alarm_asset_logo() |>
    magick::image_read()

  if (band) {
    band_path <- alarm_asset_band() |>
      magick::image_read()
  }

  if (band) {
    gg +
      patchwork::inset_element(
        p = magick::image_ggplot(band_path),
        left = 0, bottom = 0,
        right = 1, top = logo_top,
        on_top = FALSE,
        align_to = 'full'
      ) +
      patchwork::inset_element(
        p = magick::image_ggplot(logo),
        left = logo_left, bottom = logo_bottom,
        right = logo_right, top = logo_top,
        align_to = 'full'
      )
  } else {
    gg +
      patchwork::inset_element(
        p = magick::image_ggplot(logo),
        left = logo_left, bottom = logo_bottom,
        right = logo_right, top = logo_top,
        align_to = 'full'
      )
  }
}

alarm_asset_logo <- function() {
  if (requireNamespace('fs', quietly = TRUE)) {
    fs::path_package(package = 'alarm', 'assets/alarm_256_tr.png')
  } else {
    system.file('assets/alarm_256_tr.png', package = 'alarm')
  }
}

alarm_asset_band <- function() {
  if (requireNamespace('fs', quietly = TRUE)) {
    fs::path_package(package = 'alarm', 'assets/blue_horizontal.png')
  } else {
    system.file('assets/blue_horizontal.png', package = 'alarm')
  }
}


#' Add ALARM Project logo to a ggplot2 object
#'
#' @param gg a ggplot2 object
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
gg_annotate_alarm <- function(gg) {
  if (!requireNamespace('magick', quietly = TRUE)) {
    stop('Please install the magick package to use this function')
  }
  if (!requireNamespace('patchwork', quietly = TRUE)) {
    stop('Please install the patchwork package to use this function')
  }
  logo <- alarm_asset_logo() |>
    magick::image_read()

  gg +
    patchwork::inset_element(
      p = magick::image_ggplot(logo),
      left = .9, bottom = 0.01,
      right = .99, top = 0.1,
      align_to = 'full'
    )
}

alarm_asset_logo <- function() {
  if (requireNamespace('fs', quietly = TRUE)) {
    fs::path_package(package = 'alarm', 'assets/alarm_256_tr.png')
  } else {
    system.file('assets/alarm_256_tr.png', package = 'alarm')
  }
}


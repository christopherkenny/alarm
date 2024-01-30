#' ALARM Project theme for [ggplot2]
#'
#' @param ... arguments to pass to [ggplot2::theme]
#'
#' @return a `ggplot2` `theme` element
#' @export
#'
#' @examples
#' ggplot2::mpg |>
#'   ggplot2::ggplot() +
#'    ggplot2::geom_point(ggplot2::aes(displ, hwy, color = class)) +
#'    scale_color_alarm() +
#'    theme_alarm_dark
#'
#' ggplot2::mpg |>
#'   ggplot2::ggplot() +
#'    ggplot2::geom_point(ggplot2::aes(displ, hwy, color = class)) +
#'    ggplot2::facet_wrap(~manufacturer) +
#'    scale_color_alarm() +
#'    theme_alarm_dark
#'
theme_alarm_dark <- function(...) {
  ggplot2::theme_dark() +
    ggplot2::theme(
      plot.background = ggplot2::element_rect(fill = 'black'),
      panel.background = ggplot2::element_rect(fill = '#303030'),
      legend.background = ggplot2::element_rect(fill = '#7F7F7F'),
      text = ggplot2::element_text(color = '#FFFFFF'),
      axis.text = ggplot2::element_text(color = '#FFFFFF'),
      legend.text = ggplot2::element_text(color = 'black'),
      legend.title = ggplot2::element_text(color = 'black'),
      ...
    )
}

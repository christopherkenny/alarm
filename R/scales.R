#' ALARM Project Scales for `ggplot2`
#'
#' @param palette palette from `names(alarm)` to use
#' @param which numeric indices of colors to use. `NULL` by default.
#' @param ... arguments passed on to `ggplot2::discrete_scale()`
#' @param reverse Should the vector be reversed? Default is `FALSE`.
#'
#' @return A [ggplot2::Scale]
#'
#' @examples
#' ggplot2::mpg |>
#'   ggplot2::ggplot() +
#'    ggplot2::geom_point(ggplot2::aes(displ, hwy, colour = class)) +
#'    scale_color_alarm()
#'
#' ggplot2::mpg |>
#'   ggplot2::ggplot() +
#'    ggplot2::geom_point(ggplot2::aes(displ, hwy, fill = class),
#'    pch = 23, color = 'transparent') +
#'    scale_fill_alarm()
#'
#' @rdname scale_alarm
#' @export
scale_color_alarm <- function(palette = 'alarm', which = NULL, ..., reverse = FALSE) {

  pal <- alarm[[palette]]

  if (!is.null(which)) {
    pal <- pal[which]
  }
  if (reverse) {
    pal <- rev(pal)
  }
  ggplot2::discrete_scale(aesthetics = 'color', scale_name = palette,
                          palette = rot_pal(pal), ...)
}


#' @rdname scale_alarm
#' @export
scale_fill_alarm <- function(palette = 'alarm', which = NULL, ...,
                           reverse = FALSE) {
  pal <- alarm[[palette]]
  if (!is.null(which)) {
    pal <- pal[which]
  }
  if (reverse) {
    pal <- rev(pal)
  }
  ggplot2::discrete_scale(aesthetics = 'fill', scale_name = palette, ...,
                          palette = rot_pal(pal))
}

#' @rdname scale_alarm
#' @export
scale_colour_alarm <- scale_color_alarm

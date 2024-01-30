#' Create a PowerPoint with ALARM Project theming
#'
#' @param template character string, either `'light'` or `'dark'`
#'
#' @return an object of class `rpptx`
#' @export
#'
#' @examples
#' file_ppt <- tempfile(fileext = '.pptx')
#' alarm_ppt_create() |>
#'   print(target = file_ppt)
alarm_ppt_create <- function(template = 'light') {
  alarm_ppt_template(template) |>
    officer::read_pptx()
}

#' Get ALARM PowerPoint templates
#'
#' @param template character string, either `'light'` or `'dark'`
#'
#' @return path to a `'.potx'` file
#' @export
#'
#' @examples
#' alarm_ppt_template('light')
alarm_ppt_template <- function(template = 'light') {
  match.arg(template, c('light', 'dark'))
  if (requireNamespace('fs', quietly = TRUE)) {
    if (template == 'light') {
      fs::path_package(package = 'alarm', 'templates', 'alarm_light.potx')
    } else {
      fs::path_package(package = 'alarm', 'templates', 'alarm_dark.potx')
    }
  } else {
    if (template == 'light') {
      system.file('templates', 'alarm_light.potx', package = 'alarm')
    } else {
      system.file('templates', 'alarm_dark.potx', package = 'alarm')
    }
  }

}

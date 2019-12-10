knit_print.grViz <- function(x, ...) {
  svg <- DiagrammeRsvg::export_svg(x)

  md <- c("`````{=html}\n", svg, "\n`````\n")

  knitr::asis_output(md)
}

#' Register a knit_print() method for grViz objects
#'
#' This function registers a method for [knit_print()] for [grViz] objects.
#' With this method enabled, rendered HTML documents no longer require
#' a viz.js dependency.
#' Instead, embedded SVG is inserted into the Markdown.
#' The resulting HTML documents have a smaller footprint and are rendered faster.
#'
#' @export
register_knit_print <- function() {
  stopifnot(rlang::is_installed("vctrs"))
  stopifnot(rlang::is_installed("knitr"))
  vctrs::s3_register("knitr::knit_print", "grViz")
}

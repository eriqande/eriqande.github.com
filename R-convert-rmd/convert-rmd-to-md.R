

library(stringr)


#' modifies intermediate md file from Rmd rendering and puts in _posts
#' 
#' more more more
#' @param file  path to md file that needs converting
#' @param layout the name of the layout wanted in the yaml header
#' @param title the title of the post.  If NULL then we get it from the md file.
#' @param outdir the directory where the final result should be saved
#' @param imgdir_regex_pattern string giving a regular expression that will pick out the
#' links to the images (plots).
#' @param imgdir_regex_replace replacement string for the imgdir_regex_pattern
transfer_md <- function(file,
                        layout = "minimal_post",
                        title = NULL,
                        outdir = "_posts",
                        imgdir_regex_pattern = "\\.\\./assets/",
                        imgdir_regex_replace = "{{ site.url }}/assets/"
                        ) {
  
  x <- readLines(file)
  if(is.null(title)) {
    title <- str_replace(x[1], "^#  *", "")
  }
  # put the md header on it, overwriting the title block that render() stuck on it
  x[1] <- paste("---\nlayout: ", layout, "\ntitle: ", title, "\n---", collapse = "", sep = "")
  
  
  # put the site.url up front on the images
  x2 <- str_replace_all(x, imgdir_regex_pattern,  imgdir_regex_replace)
  
  # find the lines where images are put in:
  imgs <- str_detect(x2, "^<img src")
  
  # on each of those, remove the width and heigh specs, as they just screw things
  # up and change the aspect ratio obtained by knitting with Rmd
  x2[imgs] <- str_replace_all(x2[imgs], "(width|height)=\"[a-z0-9]*\"", "")
  
  # write the result into the output dir
  cat(x2, sep="\n", file = file.path(outdir, basename(file)))
  
  
}

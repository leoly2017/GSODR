## ----check_packages, echo=FALSE, messages=FALSE, warning=FALSE-----------
required <- c("spacetime", "plotKML", "GSODRdata", "reshape2")

if (!all(unlist(lapply(required, function(pkg) requireNamespace(pkg, quietly = TRUE)))))
  knitr::opts_chunk$set(eval = FALSE)


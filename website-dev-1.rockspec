dependencies = {
   "lapis ~> 1.16",
   "cqueues == 20200726.51",
   "http ~> 0.4"
}

-- useless
package = "website"
version = "dev-1"
source = {
   url = "git+https://github.com/mbekkomo/mbekkomo.github.io.git"
}
description = {
   homepage = "https://github.com/mbekkomo/mbekkomo.github.io",
   license = "*** please specify a license ***"
}
build = {
   type = "builtin",
   modules = {}
}

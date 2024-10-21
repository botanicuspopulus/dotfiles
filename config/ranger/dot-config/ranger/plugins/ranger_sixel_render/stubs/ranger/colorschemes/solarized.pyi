from ranger.gui.color import bold as bold, cyan as cyan, default as default, default_colors as default_colors, magenta as magenta, normal as normal, red as red, reverse as reverse, white as white
from ranger.gui.colorscheme import ColorScheme as ColorScheme

class Solarized(ColorScheme):
    progress_bar_color: int
    def use(self, context): ...

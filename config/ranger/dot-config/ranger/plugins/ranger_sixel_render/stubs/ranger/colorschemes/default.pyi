from ranger.gui.color import BRIGHT as BRIGHT, black as black, blue as blue, bold as bold, cyan as cyan, default as default, default_colors as default_colors, dim as dim, green as green, magenta as magenta, normal as normal, red as red, reverse as reverse, white as white, yellow as yellow
from ranger.gui.colorscheme import ColorScheme as ColorScheme

class Default(ColorScheme):
    progress_bar_color = blue
    def use(self, context): ...

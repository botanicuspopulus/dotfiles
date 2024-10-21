from ranger.colorschemes.default import Default as Default
from ranger.gui.color import blue as blue, green as green, red as red

class Scheme(Default):
    progress_bar_color = green
    def use(self, context): ...

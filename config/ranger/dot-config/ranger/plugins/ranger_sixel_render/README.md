# Sixel Render Plugin for Ranger

## Overview

The Sixel Render Plugin for Ranger enhances the file manager by enabling the display of images using the SIXEL graphics protocol. This plugin leverages ImageMagick to convert images into SIXEL format, which can then be rendered directly in the terminal.

## Features

- Display images in the terminal using SIXEL graphics.
- Cache images to improve performance and reduce redundant processing.
- Automatically clear cache when previews are cleared.

## Requirements

- **Ranger**: A console file manager with VI key bindings.
- **ImageMagick**: A software suite to create, edit, compose, or convert bitmap images.
- **SIXEL-compatible terminal**: A terminal that supports SIXEL graphics (e.g., XTerm, iTerm2).

## Installation

1. **Clone the repository**:
    ```sh
    git clone https://github.com/yourusername/ranger_sixel_render.git ~/.config/ranger/plugins/
    ```

## Usage

Once installed, the plugin will automatically handle image previews in Ranger. Navigate to an image file, and the plugin will display the image using SIXEL graphics.

## Configuration

You can customize the plugin by modifying the `command.py` file. Key areas you might want to adjust include:

- **SIXEL Dithering**: Change the dithering method used by ImageMagick.
- **Cache Management**: Adjust how and when the cache is cleared.

## Example

Here's an example of how to use the plugin:

1. Open Ranger:
    ```sh
    ranger

2. Navigate to a directory containing image files.

3. Select an image file to preview it in the terminal.

## Troubleshooting

- **ImageMagick not found**: Ensure ImageMagick is installed and accessible in your PATH.
- **SIXEL not supported**: Verify that your terminal supports SIXEL graphics.

## Contributing

Contributions are welcome! Feel free to open issues or submit pull requests on the [GitHub repository](https://github.com/yourusername/sixel_render_plugin).

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

- [Ranger](https://github.com/ranger/ranger)
- [ImageMagick](https://imagemagick.org/)
- [SIXEL Graphics](https://en.wikipedia.org/wiki/Sixel)

;;; solana-dark-theme.el --- Legible dark theme with Solana's purple and green colors -*- lexical-binding:t -*-

;; Copyright (C) 2026  Tiago Guimarães

;; Author: Tiago Guimarães <tiago@cow.fi>
;; Maintainer: Tiago Guimarães <tiago@cow.fi>
;; URL: https://github.com/tilacog/solana-themes
;; Keywords: faces, theme, accessibility

;; This file is NOT part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; A dark and a light theme for GNU Emacs built around the Solana
;; brand palette (see <https://solana.com/branding>): purple #9945FF
;; and green #14F195 as the anchors, with dark, white and secondary
;; hues in supporting roles.  Generated with the `modus-themes' engine;
;; every text/background pair meets WCAG AA contrast (>= 4.5).

;;; Code:



(require 'solana-themes)

(defconst solana-dark-palette-partial
  '((cursor "#14f195")
    (bg-main "#1a1430")
    (bg-dim "#281d43")
    (bg-alt "#2c2148")
    (fg-main "#c5afe4")
    (fg-dim "#9c84c0")
    (fg-alt "#b094d9")
    (bg-active "#4d3583")
    (bg-inactive "#322843")
    (border "#7f5cab")

    (red "#f66d78")
    (red-warmer "#f76539")
    (red-cooler "#f06891")
    (red-faint "#c97279")
    (green "#0cba7a")
    (green-warmer "#1aab15")
    (green-cooler "#1cab9c")
    (green-faint "#4e9078")
    (yellow "#cb990d")
    (yellow-warmer "#e97a0a")
    (yellow-cooler "#bfa70f")
    (yellow-faint "#a0863d")
    (blue "#8a8af6")
    (blue-warmer "#9283db")
    (blue-cooler "#7d94f4")
    (blue-faint "#8888dd")
    (magenta "#c18efa")
    (magenta-warmer "#f063f0")
    (magenta-cooler "#a27ef7")
    (magenta-faint "#8d79a5")
    (cyan "#16aadf")
    (cyan-warmer "#18a7a7")
    (cyan-cooler "#579eee")
    (cyan-faint "#5293aa")

    (bg-red-intense "#841f2d")
    (bg-green-intense "#135039")
    (bg-yellow-intense "#554414")
    (bg-blue-intense "#2d2dbe")
    (bg-magenta-intense "#5d259c")
    (bg-cyan-intense "#174b64")

    (bg-red-subtle "#681a25")
    (bg-green-subtle "#103f2e")
    (bg-yellow-subtle "#433511")
    (bg-blue-subtle "#252594")
    (bg-magenta-subtle "#491f7b")
    (bg-cyan-subtle "#143b4f")

    (bg-added "#0c3d2b")
    (bg-added-faint "#0c2f22")
    (bg-added-refine "#0b452f")
    (bg-added-fringe "#0b4c34")
    (fg-added "#0fbd7e")

    (bg-changed "#3f340c")
    (bg-changed-faint "#30280d")
    (bg-changed-refine "#493b0c")
    (bg-changed-fringe "#52410c")
    (fg-changed "#cca011")

    (bg-removed "#68141f")
    (bg-removed-faint "#4d151c")
    (bg-removed-refine "#761321")
    (bg-removed-fringe "#851322")
    (fg-removed "#f58392")

    (bg-mode-line-active "#6210c0")
    (fg-mode-line-active "#f0e8ff")
    (bg-completion "#36256b")
    (bg-popup "#281c68")
    (bg-hover "#59269a")
    (bg-hover-secondary "#564119")
    (bg-hl-line "#271841")
    (bg-paren-match "#164c39")
    (bg-err "#4f1c22") ; check with err
    (bg-warning "#352c12") ; check with warning
    (bg-info "#113327") ; check with info
    (bg-region "#4a2b73")))

(defconst solana-dark-palette-mappings-partial
  '((err red)
    (warning yellow-warmer)
    (info green)

    (fg-link magenta-cooler)
    (fg-link-visited green-faint)
    (name magenta)
    (keybind green-cooler)
    (identifier cyan-faint)
    (fg-prompt green)

    (builtin yellow)
    (comment magenta-faint)
    (constant magenta-warmer)
    (fnname cyan)
    (fnname-call cyan-faint)
    (keyword magenta)
    (preprocessor red)
    (docstring green-faint)
    (string green)
    (type blue-cooler)
    (variable fg-alt)
    (variable-use fg-dim)
    (rx-backslash yellow-cooler) ; compare with `string'
    (rx-construct red-warmer)

    (accent-0 magenta)
    (accent-1 green)
    (accent-2 cyan)
    (accent-3 blue-cooler)

    (date-common cyan)
    (date-deadline red)
    (date-deadline-subtle red-faint)
    (date-event fg-alt)
    (date-holiday magenta-warmer)
    (date-now fg-main)
    (date-range fg-alt)
    (date-scheduled yellow-cooler)
    (date-scheduled-subtle yellow-faint)
    (date-weekday cyan)
    (date-weekend red-faint)

    (fg-prose-code magenta-warmer)
    (prose-done green)
    (fg-prose-macro cyan)
    (prose-metadata fg-dim)
    (prose-metadata-value fg-alt)
    (prose-table fg-alt)
    (prose-table-formula info)
    (prose-tag yellow-faint)
    (prose-todo red)
    (fg-prose-verbatim green)

    (mail-cite-0 magenta)
    (mail-cite-1 green)
    (mail-cite-2 cyan)
    (mail-cite-3 yellow-cooler)
    (mail-part blue-cooler)
    (mail-recipient red-cooler)
    (mail-subject magenta-warmer)
    (mail-other yellow-warmer)

    (bg-search-static bg-warning)
    (bg-search-current bg-yellow-intense)
    (bg-search-lazy bg-blue-intense)
    (bg-search-replace bg-red-intense)

    (bg-search-rx-group-0 bg-magenta-intense)
    (bg-search-rx-group-1 bg-green-intense)
    (bg-search-rx-group-2 bg-red-subtle)
    (bg-search-rx-group-3 bg-cyan-subtle)

    (bg-space-err bg-yellow-intense)

    (rainbow-0 magenta)
    (rainbow-1 green)
    (rainbow-2 yellow)
    (rainbow-3 cyan)
    (rainbow-4 blue-cooler)
    (rainbow-5 magenta-warmer)
    (rainbow-6 yellow-cooler)
    (rainbow-7 green-cooler)
    (rainbow-8 cyan-cooler)))

(defcustom solana-dark-palette-overrides nil
  "Overrides for `solana-dark-palette'.

Mirror the elements of the aforementioned palette, overriding
their value.

For overrides that are shared across both Solana themes, refer
to `solana-themes-common-palette-overrides'.

To preview the palette entries, use `modus-themes-list-colors' or
`modus-themes-list-colors-current'."
  :group 'solana-themes
  :package-version '(solana-themes . "1.0.0")
  :type '(repeat (list symbol (choice symbol string))))

(defconst solana-dark-palette
  (modus-themes-generate-palette
   solana-dark-palette-partial
   nil
   nil
   (append solana-dark-palette-mappings-partial solana-themes-palette-common)))

;;;###theme-autoload
(modus-themes-theme
 'solana-dark
 'solana-themes
 "Legible dark theme with Solana's purple and green colors."
 'dark
 'solana-dark-palette
 nil
 'solana-dark-palette-overrides)

(provide 'solana-dark-theme)

;;; solana-dark-theme.el ends here

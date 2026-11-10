;;; solana-light-theme.el --- Legible light theme with Solana's purple and green colors -*- lexical-binding:t -*-

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

(defconst solana-light-palette-partial
  '((cursor "#9945ff")
    (bg-main "#f5f3fd")
    (bg-dim "#eeeaf6")
    (bg-alt "#e9e3f3")
    (fg-main "#5b3596")
    (fg-dim "#7452a8")
    (fg-alt "#6d3db5")
    (bg-active "#d1c6e9")
    (bg-inactive "#e9e5ed")
    (border "#ab96c7")

    (red "#bf1321")
    (red-warmer "#b9340c")
    (red-cooler "#bc1b4b")
    (red-faint "#b14851")
    (green "#0b6a47")
    (green-warmer "#187715")
    (green-cooler "#156e66")
    (green-faint "#437864")
    (yellow "#775b0c")
    (yellow-warmer "#944e09")
    (yellow-cooler "#6d600c")
    (yellow-faint "#7c672f")
    (blue "#4c4ceb")
    (blue-warmer "#6754c9")
    (blue-cooler "#294fe5")
    (blue-faint "#5656bf")
    (magenta "#7910f0")
    (magenta-warmer "#a618a5")
    (magenta-cooler "#703bec")
    (magenta-faint "#7b6694")
    (cyan "#116686")
    (cyan-warmer "#156f70")
    (cyan-cooler "#165fb3")
    (cyan-faint "#406d7d")

    (heading-0 "#832ee5")
    (heading-1 "#832ee5")
    (heading-2 "#4c4ae9")
    (heading-3 "#1761bc")
    (heading-4 "#0f6d77")
    (heading-5 "#0e714c")
    (heading-6 "#0f6d77")
    (heading-7 "#1761bc")
    (heading-8 "#4c4ae9")

    (bg-red-intense "#f1c4ca")
    (bg-green-intense "#14f195")
    (bg-yellow-intense "#e4cc8c")
    (bg-blue-intense "#cbcbf3")
    (bg-magenta-intense "#dbc6f2")
    (bg-cyan-intense "#a9d5eb")

    (bg-red-subtle "#f3d1d5")
    (bg-green-subtle "#a1e8ce")
    (bg-yellow-subtle "#e9d8a7")
    (bg-blue-subtle "#d7d7f5")
    (bg-magenta-subtle "#e2d3f4")
    (bg-cyan-subtle "#bddeee")

    (bg-added "#81e9c2")
    (bg-added-faint "#d9f5eb")
    (bg-added-refine "#47ebae")
    (bg-added-fringe "#13df94")
    (fg-added "#0d6646")

    (bg-changed "#ebd58c")
    (bg-changed-faint "#f5eed8")
    (bg-changed-refine "#eece65")
    (bg-changed-fringe "#ecbe28")
    (fg-changed "#6d560d")

    (bg-removed "#f6cad0")
    (bg-removed-faint "#faebed")
    (bg-removed-refine "#f8c2ca")
    (bg-removed-fringe "#f8b1ba")
    (fg-removed "#af162a")

    (bg-mode-line-active "#cdb9ff")
    (fg-mode-line-active "#2a1566")
    (bg-completion "#ddd7f3")
    (bg-popup "#e9e5f8")
    (bg-hover "#d1bdec")
    (bg-hover-secondary "#e3c890")
    (bg-hl-line "#f0ebf7")
    (bg-paren-match "#14f195")
    (bg-err "#eed7da") ; check with err
    (bg-warning "#e5dbc2") ; check with warning
    (bg-info "#bee4d6") ; check with info
    (bg-region "#e2d9ef")))

(defconst solana-light-palette-mappings-partial
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

(defcustom solana-light-palette-overrides nil
  "Overrides for `solana-light-palette'.

Mirror the elements of the aforementioned palette, overriding
their value.

For overrides that are shared across both Solana themes, refer
to `solana-themes-common-palette-overrides'.

To preview the palette entries, use `modus-themes-list-colors' or
`modus-themes-list-colors-current'."
  :group 'solana-themes
  :package-version '(solana-themes . "1.0.0")
  :type '(repeat (list symbol (choice symbol string))))

(defconst solana-light-palette
  (modus-themes-generate-palette
   solana-light-palette-partial
   nil
   nil
   (append solana-light-palette-mappings-partial solana-themes-palette-common)))

;;;###theme-autoload
(modus-themes-theme
 'solana-light
 'solana-themes
 "Legible light theme with Solana's purple and green colors."
 'light
 'solana-light-palette
 nil
 'solana-light-palette-overrides)

(provide 'solana-light-theme)

;;; solana-light-theme.el ends here

;;; solana-themes.el --- Legible themes in Solana's purple and green -*- lexical-binding:t -*-

;; Copyright (C) 2026  Tiago Guimarães

;; Author: Tiago Guimarães <tiago@cow.fi>
;; Maintainer: Tiago Guimarães <tiago@cow.fi>
;; URL: https://github.com/tilacog/solana-themes
;; Version: 1.0.0
;; Package-Requires: ((emacs "28.1") (modus-themes "5.0.0"))
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
;; The `solana-themes' pair: `solana-dark' and `solana-light', built
;; around the Solana brand palette (see <https://solana.com/branding>):
;; purple #9945FF and green #14F195 as the anchors, with dark, white
;; and secondary hues in supporting roles.  Hues are anchored to those
;; two colors and every lightness is tuned so that each text/background
;; pair meets WCAG AA contrast (>= 4.5).
;;
;; This package is not affiliated with, endorsed by, or connected to
;; the Solana Foundation.
;;
;; Themes derive from the `modus-themes' engine, which provides the
;; face machinery and the usual user options (headings, prompts,
;; mixed fonts, palette overrides, ...).
;;; Code:

(require 'modus-themes)

(defgroup solana-themes ()
  "Legible themes in Solana's purple and green.
The `solana-themes' are built on top of the `modus-themes'.  To make
all the Modus commands that operate on a theme only consider the Solana
themes, enable `modus-themes-include-derivatives-mode' or use the
commands defined herein."
  :group 'faces
  :group 'modus-themes
  :prefix "solana-themes-"
  :tag "Solana Themes")

(defvaralias 'solana-themes-common-palette-overrides
  'modus-themes-common-palette-overrides
  "Alias for `modus-themes-common-palette-overrides'.
Palette overrides that are shared across both Solana themes.")

(defconst solana-themes-light-themes
  '(solana-light)
  "List of symbols with the light Solana themes.")

(defconst solana-themes-dark-themes
  '(solana-dark)
  "List of symbols with the dark Solana themes.")

(defconst solana-themes-items
  (append solana-themes-light-themes solana-themes-dark-themes)
  "Symbols of all the Solana themes.")

(defconst solana-themes-palette-common
  '((fringe unspecified)
    (property variable)
    (fg-region unspecified)

    (bg-diff-context bg-dim)

    (bg-tab-bar bg-alt)
    (bg-tab-current bg-main)
    (bg-tab-other bg-active)

    (fg-link-symbolic fg-alt)
    (underline-link border)
    (underline-link-visited border)
    (underline-link-symbolic border)

    (border-mode-line-active border)
    (bg-mode-line-inactive bg-alt)
    (fg-mode-line-inactive fg-dim)
    (border-mode-line-inactive border)

    (bg-line-number-active unspecified)
    (fg-line-number-active accent-0)
    (bg-line-number-inactive unspecified)

    (bg-prominent-err bg-err)
    (bg-prominent-warning bg-warning)
    (bg-prominent-note bg-info)
    (fg-prominent-err err)
    (fg-prominent-warning warning)
    (fg-prominent-note info)

    (bg-added-fringe bg-info)
    (bg-changed-fringe bg-warning)
    (bg-removed-fringe bg-err)

    (bg-space unspecified)
    (fg-space border)

    (bg-active-argument bg-warning)
    (fg-active-argument warning)
    (bg-active-value bg-info)
    (fg-active-value info)

    (bg-mark-delete bg-err)
    (fg-mark-delete err)
    (bg-mark-select bg-info)
    (fg-mark-select info)
    (bg-mark-other bg-warning)
    (fg-mark-other warning)

    (fg-search-current fg-main)
    (fg-search-lazy fg-main)
    (fg-search-static fg-main)
    (fg-search-replace fg-main)

    (fg-search-rx-group-0 fg-main)
    (fg-search-rx-group-1 fg-main)
    (fg-search-rx-group-2 fg-main)
    (fg-search-rx-group-3 fg-main)

    (fg-completion-match-0 accent-0)
    (fg-completion-match-1 accent-1)
    (fg-completion-match-2 accent-2)
    (fg-completion-match-3 accent-3)

    (fg-heading-0 heading-0)
    (fg-heading-1 heading-1)
    (fg-heading-2 heading-2)
    (fg-heading-3 heading-3)
    (fg-heading-4 heading-4)
    (fg-heading-5 heading-5)
    (fg-heading-6 heading-6)
    (fg-heading-7 heading-7)
    (fg-heading-8 heading-8))
  "Shared palette mappings for the Solana themes.\nAdapted from the `ef-themes' package by Protesilaos (GPL-3.0+).")

(defconst solana-themes-with-properties
  '((solana-dark solana-themes "Legible dark theme with Solana's purple and green colors." dark solana-dark-palette nil solana-dark-palette-overrides)
    (solana-light solana-themes "Legible light theme with Solana's purple and green colors." light solana-light-palette nil solana-light-palette-overrides))
  "The Solana themes with their properties for `modus-themes-declare'.")

(defvar solana-themes--declared-p nil)

(defun solana-themes-declare-themes ()
  "Declare the Solana themes to the `modus-themes'."
  (unless solana-themes--declared-p
    (dolist (theme solana-themes-with-properties)
      (apply #'modus-themes-declare theme)
      (modus-themes-register (car theme)))
    (setq solana-themes--declared-p t)))

(solana-themes-declare-themes)

;;;; Convenience commands

;;;###autoload (autoload 'solana-themes-toggle "solana-themes")
(modus-themes-define-derivative-command solana-themes toggle)

;;;###autoload (autoload 'solana-themes-rotate "solana-themes")
(modus-themes-define-derivative-command solana-themes rotate)

;;;###autoload (autoload 'solana-themes-rotate-light "solana-themes")
(modus-themes-define-derivative-command solana-themes rotate-light)

;;;###autoload (autoload 'solana-themes-rotate-dark "solana-themes")
(modus-themes-define-derivative-command solana-themes rotate-dark)

;;;###autoload (autoload 'solana-themes-select "solana-themes")
(modus-themes-define-derivative-command solana-themes select)

;;;###autoload (autoload 'solana-themes-select-dark "solana-themes")
(modus-themes-define-derivative-command solana-themes select-dark)

;;;###autoload (autoload 'solana-themes-select-light "solana-themes")
(modus-themes-define-derivative-command solana-themes select-light)

;;;###autoload (autoload 'solana-themes-load-random "solana-themes")
(modus-themes-define-derivative-command solana-themes load-random)

;;;###autoload (autoload 'solana-themes-load-random-dark "solana-themes")
(modus-themes-define-derivative-command solana-themes load-random-dark)

;;;###autoload (autoload 'solana-themes-load-random-light "solana-themes")
(modus-themes-define-derivative-command solana-themes load-random-light)

;;;###autoload (autoload 'solana-themes-list-colors "solana-themes")
(modus-themes-define-derivative-command solana-themes list-colors)

;;;###autoload (autoload 'solana-themes-list-colors-current "solana-themes")
(modus-themes-define-derivative-command solana-themes list-colors-current)

;;;; Add themes from package to path

;;;###autoload
(when load-file-name
  (let ((dir (file-name-directory load-file-name)))
    (unless (file-equal-p dir (expand-file-name "themes/" data-directory))
      (add-to-list 'custom-theme-load-path dir))))

(provide 'solana-themes)
;;; solana-themes.el ends here

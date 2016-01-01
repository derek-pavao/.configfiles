(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "~/.emacs.d/lisp/elpa/")
(add-to-list 'load-path "~/.emacs.d/lisp/nginx-mode/")
(add-to-list 'load-path "~/.emacs.d/lisp/coffee-mode/")


(package-initialize)
;; load the fancy... tern http://ternjs.net/
(add-to-list 'load-path "/Users/dpavao/.configfiles/tern/emacs/")

(autoload 'tern-mode "tern.el" nil t)
(autoload 'angular-mode "angular-mode.el" nil t)
(autoload 'reference-tsd-d "reference-tsd-d" nil t)

(global-set-key (kbd "M-x") 'smex)

;; (show-paren-mode 1)
;; (setq show-paren-delay 0)

(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

(add-hook 'js2-post-parse-callbacks (lambda () (tern-mode t)))



(eval-after-load 'tern
  '(progn
     (require 'tern-auto-complete)
     (tern-ac-setup)))

;; add package archives
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages")
                         ("melpa" . "http://melpa.milkbox.net/packages")))


(global-set-key (kbd "C-M-/") 'my-expand-file-name-at-point)
(defun my-expand-file-name-at-point ()
  "Use hippie-expand to expand the filename"
  (interactive)
  (let ((hippie-expand-try-functions-list '(try-complete-file-name-partially try-complete-file-name)))
    (call-interactively 'hippie-expand)))


;; add nginx mode for config files
(require 'nginx-mode)
(add-to-list 'auto-mode-alist '("/usr/local/etc/nginx/.*" . nginx-mode))


(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))


;;(load "php-mode")

(load "find-file-in-git-repo")

(require 'pi-php-mode)
(require 'smooth-scroll)
(require 'package)

(kill-buffer "*scratch*")


(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-to-list 'auto-mode-alist '("\\.scss$" . css-mode))

;; Interactively do things
;; adds nice autocomplete in mini buffer for C-c C-f
(require 'ido)
(ido-mode t)

;; Don't use messages that you don't read
(setq initial-scratch-message "")
(setq inhibit-startup-message t)

;; Turn off electric-indent-mode its annoying
(setq electric-indent-mode nil)
;; Syntax checking on the fly
(require 'flymake)

(custom-set-variables
     '(help-at-pt-timer-delay 0.9)
     '(help-at-pt-display-when-idle '(flymake-overlay)))


(iswitchb-mode 1)

(setq completions-format 'vertical)

;; (add-to-list 'package-archives
;;              '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))



(add-to-list 'custom-theme-load-path "~/.emacs.d/lisp/themes")

(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
;; (global-hl-line-mode 1)
;; (set-face-background 'hl-line "#fff")

(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))

;; kill all buffers except the current one
(defun kill-other-buffers ()
      "Kill all other buffers."
      (interactive)
      (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))


;; Set some custom keyboard shortcuts
(global-set-key (kbd "C-x f") 'find-file-in-git-repo)
;; (global-set-key (kbd "C-x /") 'comment-or-uncomment-region)
(global-set-key (kbd "C-x /") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "<C-tab>") 'indent-for-tab-command)


;; define some convenience aliases
(defalias 'rb 'revert-buffer)
(defalias 'kob 'kill-other-buffers)
(defalias 'kb 'kill-buffer)
(defalias 'col-mode 'highlight-indentation-current-column-mode)

;; Save backups to a different directory so they're
;; not in the current directory. Git doesn't like that
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying t)

;; Save all tempfiles in $TMPDIR/emacs$UID/
(defconst emacs-tmp-dir (format "%s/%s%s/" temporary-file-directory "emacs" (user-uid)))
(setq backup-directory-alist
      `((".*" . ,emacs-tmp-dir)))
(setq auto-save-file-name-transforms
      `((".*" ,emacs-tmp-dir t)))
(setq auto-save-list-file-prefix
      emacs-tmp-dir)

;;(setq create-lockfiles nil)

(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))
(setq mouse-sel-mode t)
(global-set-key [mouse-4] '(lambda ()
                             (interactive)
                             (scroll-down 1)))
(global-set-key [mouse-5] '(lambda ()
                             (interactive)
                             (scroll-up 1)))


;; (load-theme 'misterioso t)
(set-default 'truncate-lines t)
(set-default 'scroll-preserve-screen-position t)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))



(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq-default indent-tabs-mode nil) ;; spaces not tabs
(setq js-indent-level 4)
;;(global-linum-mode 1)


(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'untabify (point-min) (point-max))



(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/lisp/ac-dict")
(ac-config-default)

;; If use bundled typescript.el,
(require 'typescript)
(add-to-list 'auto-mode-alist '("\\.ts$" . typescript-mode))

(require 'tss)

;; make switch statements indent correctly
(add-hook 'typescript-mode-hook
          (lambda ()
             (c-set-offset 'case-label '+)))

;; sample config
;; (add-hook 'typescript-mode-hook
;;           (lambda ()
;;             (tide-setup)
;;             (flycheck-mode +1)
;;             (setq flycheck-check-syntax-automatically '(save mode-enabled))
;;             (eldoc-mode +1)
;;             ;; company is an optional dependency. You have to
;;             ;; install it separately via package-install
;;             (company-mode-on)))

;; Key binding
(setq tss-popup-help-key "C-:")
(setq tss-jump-to-definition-key "C->")
(setq tss-implement-definition-key "C-c i")

;; Make config suit for you. About the config item, eval the following sexp.
;; (customize-group "tss")

;; Do setting recommemded configuration
(tss-config-default)




;; (defun delete-whole-line ()
;;   (let ((beg (progn (forward-line 0)
;;                     (point))))
;;     (forward-line 1)
;;     (delete-region beg (point))))

;; (defun check-for-typings-dir (prefix)
;;   (if (not (file-directory-p (concat prefix "typings")))
;;       (check-for-typings-dir (concat prefix "../"))  (concat prefix "typings/tsd.d"))
;; )

;; (defun import-tsd.d ()
;;   (interactive)
;;   (defvar orig-point (point))
;;   (goto-char (point-min))
;;   (insert "import '" (check-for-typings-dir "./") "';" "\n")
;;   (goto-char (point-min))
;;   (save-buffer)
;;   (delete-whole-line)
;;   (save-buffer)
;;   (goto-char orig-point)

;; )

;; (defun reference-tsd.d ()
;;   (interactive)
;;   (defvar orig-point (point))
;;   (goto-char (point-min))
;;   (insert "/// <reference path=\"" (check-for-typings-dir "./") ".ts\" />\n")
;;   (goto-char orig-point)
;; )

;; js2 config
(setq-default js2-global-externs '("module" "require" "jasmine" "it" "beforeEach" "expect" "spyOn" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON" "angular" "_" "$" "jQuery"))

;; File name autocomplete
(global-set-key "\M-/" 'comint-dynamic-complete-filename)




(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#839496"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (flatland)))
 '(custom-safe-themes
   (quote
    ("8eaa3bce3c618cd81a318fcf2d28c1cd21278531f028feb53186f6387547dfb4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "fe243221e262fe5144e89bb5025e7848cd9fb857ff5b2d8447d115e58fede8f7" default)))
 '(fci-rule-color "#eee8d5")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(magit-diff-use-overlays nil)
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c37300")
     (60 . "#b97d00")
     (80 . "#b58900")
     (100 . "#a18700")
     (120 . "#9b8700")
     (140 . "#948700")
     (160 . "#8d8700")
     (180 . "#859900")
     (200 . "#5a942c")
     (220 . "#439b43")
     (240 . "#2da159")
     (260 . "#16a870")
     (280 . "#2aa198")
     (300 . "#009fa7")
     (320 . "#0097b7")
     (340 . "#008fc7")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496"))))

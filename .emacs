;; window move wtih M-<arrows>

(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/multiple-cursors.el/")
(add-to-list 'load-path "~/.emacs.d/nginx-mode/")
(add-to-list 'load-path "~/.emacs.d/coffee-mode/")

;; load the fancy... tern http://ternjs.net/
(add-to-list 'load-path "/Users/dpavao/.configfiles/tern/emacs/")

(autoload 'tern-mode "tern.el" nil t)
(autoload 'angular-mode "angular-mode.el" nil t)

(load "editorconfig")

;; (show-paren-mode 1)
;; (setq show-paren-delay 0)

(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

(add-hook 'js2-post-parse-callbacks (lambda () (tern-mode t)))

;; add package archives
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages")
                         ("melpa" . "http://melpa.milkbox.net/packages")))





;; add nginx mode for config files
(require 'nginx-mode)
(add-to-list 'auto-mode-alist '("/usr/local/etc/nginx/.*" . nginx-mode))


(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))
(custom-set-variables '(coffee-tab-width 2))

;;(load "php-mode")

(load "find-file-in-git-repo")

(require 'pi-php-mode)
(require 'smooth-scroll)
(require 'package)
(require 'multiple-cursors)

;; key bindings for multiple cursors
(multiple-cursors-mode t)
(global-set-key (kbd "C-c .") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c ,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(kill-buffer "*scratch*")


;; autoload js2mode
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-to-list 'auto-mode-alist '("\\.scss$" . css-mode))

;; Interactively do things
;; adds nice autocomplete in mini buffer for C-c C-f
(require 'ido)
(ido-mode t)

;; Don't use messages that you don't read
(setq initial-scratch-message "")
(setq inhibit-startup-message t)


;; Syntax checking on the fly
(require 'flymake)

(iswitchb-mode 1)

(setq completions-format 'vertical)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))

(package-initialize)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
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


(load-theme 'deeper-blue t)
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
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)


;; js2 config
(setq-default js2-global-externs '("module" "require" "jasmine" "it" "beforeEach" "expect" "spyOn" "assert" "refute" "setTimeout" "clearTimeout" "setInterval" "clearInterval" "location" "__dirname" "console" "JSON" "angular" "_" "$" "jQuery"))
(require 'js2-refactor)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("a4f8d45297894ffdd98738551505a336a7b3096605b467da83fae00f53b13f01" "8eaa3bce3c618cd81a318fcf2d28c1cd21278531f028feb53186f6387547dfb4" "af9761c65a81bd14ee3f32bc2ffc966000f57e0c9d31e392bc011504674c07d6" "73abbe794b6467bbf6a9f04867da0befa604a072b38012039e8c1ba730e5f7a5" default)))
 '(inhibit-startup-screen nil)
 '(js2-basic-offset 4)
 '(mouse-wheel-progressive-speed t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

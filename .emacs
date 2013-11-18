;; window move wtih M-<arrows>

(add-to-list 'load-path "~/.emacs.d/")
;;(load "php-mode")
(load "find-file-in-git-repo")

(require 'pi-php-mode)
(require 'smooth-scroll)
(require 'package)


(iswitchb-mode 1)

(setq completions-format 'vertical)

(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
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

;; Set some custom keyboard shortcuts
(global-set-key (kbd "C-x f") 'find-file-in-git-repo)
;; (global-set-key (kbd "C-x /") 'comment-or-uncomment-region)
(global-set-key (kbd "C-x /") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "<C-tab>") 'indent-for-tab-command)


;; define some convenience aliases
(defalias 'rb 'revert-buffer)
;;(defalias 'list-buffers 'ibuffer)

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



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("a4f8d45297894ffdd98738551505a336a7b3096605b467da83fae00f53b13f01" "8eaa3bce3c618cd81a318fcf2d28c1cd21278531f028feb53186f6387547dfb4" "af9761c65a81bd14ee3f32bc2ffc966000f57e0c9d31e392bc011504674c07d6" "73abbe794b6467bbf6a9f04867da0befa604a072b38012039e8c1ba730e5f7a5" default)))
 '(inhibit-startup-screen nil)
 '(mouse-wheel-progressive-speed t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

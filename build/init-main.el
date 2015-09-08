(defconst ra/emacs-directory (concat (getenv "HOME") "/.emacs.d/"))
(defun ra/emacs-subdirectory (d) (expand-file-name d ra/emacs-directory))

(setq emacs-root-dir user-emacs-directory)

(add-to-list 'load-path (ra/emacs-subdirectory "lisp"))
(add-to-list 'load-path (ra/emacs-subdirectory "build"))

(defun add-hook-list (callback hooks)
  "Adds callback to each one of the hooks."
  (mapc (lambda (hook)
      (add-hook hook callback))
    hooks))

;; load el-get
(add-to-list 'load-path (expand-file-name "el-get/el-get" emacs-root-dir))

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))


;; load all .el files inside `modules-dir`
(setq modules-dir (expand-file-name "lisp/packages" emacs-root-dir))
(mapc 'load (directory-files modules-dir 't "^[^#].*el$"))

;; install all missing packages via el-get
(el-get 'sync (mapcar 'el-get-source-name el-get-sources))

;; I know what the scratch is for
(setq initial-scratch-message "")

;; don't show the startup help screen
(setq inhibit-startup-screen t)

;; disable alarm bell beep
(setq visible-bell t)

;; various key bindings
(load "my-chords")
(load "window")
(load "my-evil")
(load "editor")

;; load all modes
(load "load-modes")

(server-start)

;; mode line settings
(column-number-mode t)
(line-number-mode t)
(size-indication-mode t)

;; blinking cursor
(blink-cursor-mode t)

(if (window-system)
    (require 'init-client)
  (require 'init-server))

(global-linum-mode 1)

(defconst linum-mode-excludes '(
                                doc-view-mode
                                compilation-mode
                                term-mode
                                dired-mode
                                ibuffer-mode
                                eshell-mode
                                )
  "List of major modes preventing linum to be enabled in the buffer.")

(defadvice linum-mode (around linum-mode-selective activate)
  "Avoids enabling of linum-mode in the buffer having major mode set to one
of listed in `linum-mode-excludes'."
  (unless (member major-mode linum-mode-excludes)
    ad-do-it))

(provide 'init-main)

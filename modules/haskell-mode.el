(add-to-list 'el-get-sources '(
:name haskell-mode
       :description "A Haskell editing mode"
       :type github
       :pkgname "haskell/haskell-mode"
       :info "."
       :build `(("make" ,(format "EMACS=%s" el-get-emacs) "all"))
       :post-init (progn
                    (require 'haskell-mode-autoloads)
                    (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
                    (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation))


))

;; requires texinfo package
(add-to-list 'el-get-sources
             '(:name markdown-mode

                     :description "Major mode to edit Markdown files in Emacs"
                     :website "http://jblevins.org/projects/markdown-mode/"
                     :type git
                     :url "git://jblevins.org/git/markdown-mode.git"
                     :prepare (add-to-list 'auto-mode-alist
                                           '("\\.\\(md\\|mdown\\|markdown\\)\\'" . markdown-mode)))


             )


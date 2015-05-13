(add-to-list 'el-get-sources 
              '(

                :name expand-region
                :type github
                :pkgname "magnars/expand-region.el"
                :description "Expand region increases the selected region by semantic units. Just keep pressing the key until it selects what you want."
                :website "https://github.com/magnars/expand-region.el#readme"

                :depends key-chord
                :after (progn

(key-chord-define-global "4r" 'er/expand-region)
;(key-chord-define-global "e2" 'er/contract-region)


                               ))


)

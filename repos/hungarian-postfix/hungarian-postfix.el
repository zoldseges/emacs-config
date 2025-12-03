;; NOTE: maybe prefix would be more desirable from an editing standpoint.

(require 'quail)

(quail-define-package
 "hungarian-postfix" "Hungarian" "HU" t
 "Postfix input method for hungarian characters.
Type a'-> á, o: -> ö, o\"-> ő, etc."
 ;; NOTE: csetdzsipiti-ed, I should review and comment these options.
 nil t t t t nil nil nil nil)

(quail-define-rules
 ;; acute
 ("a[" ?á) ("A[" ?Á)
 ("e[" ?é) ("E[" ?É)
 ("i[" ?í) ("I[" ?Í)
 ("o[" ?ó) ("O[" ?Ó)
 ("u[" ?ú) ("U[" ?Ú)

 ;; umlaut
 ("o]" ?ö) ("O]" ?Ö)
 ("u]" ?ü) ("U]" ?Ü)

 ;; double acute
 ("o=" ?ő) ("O=" ?Ő)
 ("u=" ?ű) ("U=" ?Ű)
)

(setq default-input-method "hungarian-postfix")

(provide 'hungarian-postfix)

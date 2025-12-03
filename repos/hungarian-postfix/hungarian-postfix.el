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
 ("a1" ?á) ("A1" ?Á)
 ("e1" ?é) ("E1" ?É)
 ("i1" ?í) ("I1" ?Í)
 ("o1" ?ó) ("O1" ?Ó)
 ("u1" ?ú) ("U1" ?Ú)

 ;; umlaut
 ("o2" ?ö) ("O2" ?Ő)
 ("u2" ?ü) ("U2" ?Ű)

 ;; double acute
 ("o3" ?ő) ("O3" ?Ő)
 ("u3" ?ű) ("U3" ?Ű)

)

(provide 'hungarian-postfix)

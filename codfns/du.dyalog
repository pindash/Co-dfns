﻿ DU←{
     e←'Expression'≡∘⊃0 1⌷⊢    ⍝ (e n) indicates a node is an expression
     u←(e∧0=∘≢'name'Prop 1↑⊢)¨ ⍝ (u k) gives map of unnamed exprs
     d←(~(∨\0,1↓¯1⌽u))(/∘⊢)⊢   ⍝ (d k) drops kids after 1st unnamed ex
     f←'Function'≡∘⊃0 1⌷⊢      ⍝ (f n) tests if n is function node
     0=≢k←1 Kids ⍵:⍵           ⍝ Terminate at leaves
     ⊃⍪/(⊂1↑⍵),∇¨d⍣(f ⍵)⊢k     ⍝ Recur after dropping unnamed exprs
 }
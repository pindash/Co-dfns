:Namespace bs1

⍝ Test the Black Scholes benchmark for the correct output

BS←':Namespace' 'r←0.02	⋄ v←0.03' 
BS,←'Run←{' 'S←0⌷⍵ ⋄ X←1⌷⍵ ⋄ T←⍺ ⋄ vsqrtT←v×T*0.5'
BS,←'((⍟S÷X)+(r+(v*2)÷2)×T)÷vsqrtT' '}' ':EndNamespace'

NS←⎕FIX BS

GD←{⍉↑(5+?⍵⍴25)(1+?⍵⍴100)(0.25+100÷⍨?⍵⍴1000)}

C←#.codfns.C

BS1∆GCC_TEST←{~(⊂'gcc')∊C.TEST∆COMPILERS:0⊣#.UT.expect←0
  D←⍉GD 7 ⋄ R←⊃((⎕DR 2↑D)323)⎕DR 2↑D ⋄ L←,¯1↑D ⋄ C.COMPILER←'gcc'
  _←'Scratch/bs1'#.codfns.C.Fix BS
  _←'Run_gcc'⎕NA'./Scratch/bs1_gcc.so|Run >PP <PP <PP'
  #.UT.expect←interp←L NS.Run R
  Run_gcc 0 L R}

BS1∆ICC_TEST←{~(⊂'icc')∊C.TEST∆COMPILERS:0⊣#.UT.expect←0
  D←⍉GD 7 ⋄ R←⊃((⎕DR 2↑D)323)⎕DR 2↑D ⋄ L←,¯1↑D ⋄ C.COMPILER←'icc'
  _←'Scratch/bs1'#.codfns.C.Fix BS
  _←'Run_icc'⎕NA'./Scratch/bs1_icc.so|Run >PP <PP <PP'
  #.UT.expect←interp←L NS.Run R ⋄ C.COMPILER←'gcc'
  Run_icc 0 L R}

:EndNamespace
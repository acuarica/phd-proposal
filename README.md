
# Ph.D. Proposal

<https://acuarica.gitlab.io/phd-proposal/phd-proposal.pdf>

## Thesis TODOs

* TODO: Add discussion from <https://martinfowler.com/bliki/DynamicTyping.html>
* TODO: Discuss "Static Typing of Complex Presence Constraints in Interfaces" \cite{oostvogelsStaticTypingComplex2018a}
* TODO: Source of information for cast success: Config files, libraries, more complex analysis
* TODO: What does the compiler need to know to assert that a cast won't fail at runtime?
* TODO: Include type system soundness discussion for thesis
* TODO: Find examples where \code{instanceof} is right and wrong
* TODO: Quantify patterns, Qualitative data
* TODO: Reflection as a way to /escape/ the type system, then talk about casting as a subset of reflection.
* TODO: Expand comment on usages of C \code{goto}s in GitHub (similar to our cast study)
* TODO: What conclusions did they draw on JNI usage?
* TODO: Expand discussion on static vs. dynamic analyses for these kinds of studies
* TODO: How many JEPs have been adopted since 2015?
* TODO: Discuss "static vs. dynamic" over "staging-time vs. compile-time vs. link-time vs. load-time vs. run-time"
* TODO: Preliminary discussion about `checkcast` and `instanceof` bytecodes

### Literature Review: Add to introduction

But there is more than empirical studies at the source code level.
A machine instruction set is effectively another kind of language.
Therefore, its design can be affected by how compilers generate machine code.
Several studies targeted the \jvm{}~\cite{collberg_empirical_2007,odonoghue_bigram_2002,antonioli_analysis_1998}; while~\cite{cook_empirical_1989} did a similar study for \lilith{} in the past.
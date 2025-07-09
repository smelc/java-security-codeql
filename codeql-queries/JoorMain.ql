/**
 * @name Code injection
 * @description Interpreting unsanitized user input as code allows a malicious user to perform arbitrary
 *              code execution.
 * @kind path-problem
 * @problem.severity error
 * @security-severity 9.3
 * @sub-severity high
 * @precision high
 * @id java/code-injection
 * @tags security
 *       external/cwe/cwe-094
 *       external/cwe/cwe-095
 *       external/cwe/cwe-116
 */

import java
import semmle.code.java.dataflow.FlowSources
import JoorLib
import JoorFlow::PathGraph // So that tainted paths render nicely in the CodeQL Query Results view

private module JoorConfig implements DataFlow::ConfigSig {
  predicate isSource(DataFlow::Node source) { source instanceof ActiveThreatModelSource }

  predicate isSink(DataFlow::Node sink) { sink instanceof JoorSink }
}

module JoorFlow = TaintTracking::Global<JoorConfig>;

from JoorFlow::PathNode source, JoorFlow::PathNode sink
where JoorFlow::flowPath(source, sink)
select sink.getNode(), source, sink, "Tainted data passed to joor"

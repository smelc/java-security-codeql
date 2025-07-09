/**
 * @name GetRemoteFlowSource
 * @description Find all flow sources in the project
 * @kind problem
 * @tags correctness
 * @problem.severity recommendation
 * @sub-severity low
 * @precision very-high
 * @id py/get-remote-flow-source
 */

import java
import semmle.code.java.dataflow.FlowSources
import semmle.code.java.dataflow.internal.DataFlowNodes
private import semmle.code.java.dataflow.internal.DataFlowPrivate

// from DataFlow::Node node
// where node.getLocation().getFile().toString() = "App"
//   and node.getLocation().getStartLine() = 18
// //       and node.asExpr().(MethodCall).getMethod().getQualifiedName() = "org.joor.Reflect.call"
// select node, node.getAQlClass(), "node" //, node.asExpr().(MethodCall), node.asExpr().(MethodCall).getMethod().getQualifiedName(), "node"
from DataFlow::Node node
where
  node.getLocation().getFile().toString() = "App" and
  node.getLocation().getStartLine() = 18
// select node, node.(ArgumentNode).getCall().asCall().getQualifier()., "node"
select node, "node", node.(ArgumentNode).asExpr(), "(ArgumentNode).asExpr()"

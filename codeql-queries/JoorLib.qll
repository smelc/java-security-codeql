/**
 * This file has the qll extension because it is meant to be imported.
 * ql files on the other hand, are meant to contain a query and so
 * cannot be imported.
 *
 * See https://codeql.github.com/docs/ql-language-reference/modules/#kinds-of-modules
 */

import semmle.code.java.dataflow.FlowSources
private import semmle.code.java.dataflow.internal.DataFlowPrivate

class JoorSink extends ArgumentNode {
  JoorSink() {
    exists(MethodCall mc |
      mc.getAnArgument() = this.asExpr() and
      mc.getMethod().getQualifiedName() = "org.joor.Reflect.call"
    )
  }
}

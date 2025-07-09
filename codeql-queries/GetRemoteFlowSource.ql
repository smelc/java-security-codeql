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

from ActiveThreatModelSource src
select src, "Potential flow source"

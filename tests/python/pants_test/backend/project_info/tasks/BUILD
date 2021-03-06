# Copyright 2015 Pants project contributors (see CONTRIBUTORS.md).
# Licensed under the Apache License, Version 2.0 (see LICENSE).

python_library(
  name = 'resolve_jars_test_mixin',
  sources = ['resolve_jars_test_mixin.py'],
  dependencies = [
    'src/python/pants/util:contextutil',
  ],
)

python_tests(
  name = 'dependencies',
  sources = ['test_dependencies.py'],
  dependencies = [
    'src/python/pants/java/jar',
    'src/python/pants/backend/jvm/targets:java',
    'src/python/pants/backend/jvm/targets:jvm',
    'src/python/pants/backend/project_info/tasks:dependencies',
    'src/python/pants/backend/python/targets:python',
    'src/python/pants/backend/python:python_requirement',
    'src/python/pants/build_graph',
    'tests/python/pants_test/tasks:task_test_base',
  ]
)

python_tests(
  name = 'depmap',
  sources = ['test_depmap.py'],
  coverage = ['pants.backend.project_info.tasks.depmap'],
  dependencies = [
    'src/python/pants/backend/jvm:plugin',
    'src/python/pants/backend/project_info/tasks:depmap',
    'src/python/pants/backend/python:plugin',
    'src/python/pants/build_graph',
    'tests/python/pants_test/tasks:task_test_base',
  ]
)

python_tests(
  name = 'export',
  sources = ['test_export.py'],
  dependencies = [
    'src/python/pants/java/jar',
    'src/python/pants/backend/jvm/subsystems:junit',
    'src/python/pants/backend/jvm/subsystems:jvm_platform',
    'src/python/pants/backend/jvm/subsystems:scala_platform',
    'src/python/pants/backend/jvm/targets:java',
    'src/python/pants/backend/jvm/targets:jvm',
    'src/python/pants/backend/jvm/targets:scala',
    'src/python/pants/backend/jvm/tasks:classpath_products',
    'src/python/pants/backend/jvm:plugin',
    'src/python/pants/backend/project_info/tasks:export',
    'src/python/pants/backend/python:plugin',
    'src/python/pants/backend/python/tasks',
    'src/python/pants/base:exceptions',
    'src/python/pants/build_graph',
    'src/python/pants/java/distribution',
    'src/python/pants/util:contextutil',
    'src/python/pants/util:dirutil',
    'src/python/pants/util:osutil',
    'tests/python/pants_test/subsystem:subsystem_utils',
    'tests/python/pants_test/tasks:task_test_base',
    'tests/python/pants_test/backend/python/tasks:interpreter_cache_test_mixin',
  ]
)

python_tests(
  name = 'export_integration',
  sources = ['test_export_integration.py'],
  dependencies = [
    '3rdparty/python/twitter/commons:twitter.common.collections',
    ':resolve_jars_test_mixin',
    'src/python/pants/base:build_environment',
    'src/python/pants/build_graph',
    'src/python/pants/ivy',
    'src/python/pants/java/distribution',
    'src/python/pants/util:contextutil',
    'src/python/pants/util:process_handler',
    'tests/python/pants_test/subsystem:subsystem_utils',
    'tests/python/pants_test:int-test',
  ],
  tags = {'integration'},
  timeout = 120,
)

python_tests(
  name = 'filedeps',
  sources = ['test_filedeps.py'],
  dependencies = [
    'src/python/pants/backend/codegen:plugin',
    'src/python/pants/backend/jvm:plugin',
    'src/python/pants/backend/jvm/targets:java',
    'src/python/pants/backend/project_info/tasks:filedeps',
    'src/python/pants/build_graph',
    'tests/python/pants_test/tasks:task_test_base',
  ],
)

python_tests(
  name = 'idea_plugin_integration',
  sources = ['test_idea_plugin_integration.py'],
  dependencies = [
    'src/python/pants/backend/project_info/tasks:idea_plugin_gen',
    'tests/python/pants_test:int-test',
  ],
  tags = {'integration'},
)

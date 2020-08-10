{
  "id": null,
  "items": [
    {
      "exception": {
        "localizedMessage": "Required fields are missing: [Contact__c] REQUIRED_FIELD_MISSING",
        "cause": null,
        "message": "Required fields are missing: [Contact__c] REQUIRED_FIELD_MISSING",
        "stackTrace": [
          {
            "fileName": "BulkOperationResultMapper.java",
            "methodName": "lambda\$map\$0",
            "className": "org.mule.extension.salesforce.internal.mapper.BulkOperationResultMapper",
            "nativeMethod": false,
            "lineNumber": 36
          },
          {
            "fileName": "ArrayList.java",
            "methodName": "forEach",
            "className": "java.util.ArrayList",
            "nativeMethod": false,
            "lineNumber": 1257
          },
          {
            "fileName": "BulkOperationResultMapper.java",
            "methodName": "map",
            "className": "org.mule.extension.salesforce.internal.mapper.BulkOperationResultMapper",
            "nativeMethod": false,
            "lineNumber": 26
          },
          {
            "fileName": "CoreServiceImpl.java",
            "methodName": "upsert",
            "className": "org.mule.extension.salesforce.internal.service.CoreServiceImpl",
            "nativeMethod": false,
            "lineNumber": 167
          },
          {
            "fileName": "UpsertOperation.java",
            "methodName": "upsert",
            "className": "org.mule.extension.salesforce.internal.operation.core.UpsertOperation",
            "nativeMethod": false,
            "lineNumber": 56
          },
          {
            "fileName": null,
            "methodName": "execute",
            "className": "org.mule.extension.salesforce.internal.operation.core.UpsertOperation\$upsert\$MethodComponentExecutor",
            "nativeMethod": false,
            "lineNumber": -1
          },
          {
            "fileName": "GeneratedMethodComponentExecutor.java",
            "methodName": "execute",
            "className": "org.mule.runtime.module.extension.internal.runtime.execution.GeneratedMethodComponentExecutor",
            "nativeMethod": false,
            "lineNumber": 92
          },
          {
            "fileName": "CompletableMethodOperationExecutor.java",
            "methodName": "doExecute",
            "className": "org.mule.runtime.module.extension.internal.runtime.execution.CompletableMethodOperationExecutor",
            "nativeMethod": false,
            "lineNumber": 26
          },
          {
            "fileName": "AbstractCompletableMethodOperationExecutor.java",
            "methodName": "execute",
            "className": "org.mule.runtime.module.extension.internal.runtime.execution.AbstractCompletableMethodOperationExecutor",
            "nativeMethod": false,
            "lineNumber": 58
          },
          {
            "fileName": "DefaultExecutionMediator.java",
            "methodName": "executeCommand",
            "className": "org.mule.runtime.module.extension.internal.runtime.operation.DefaultExecutionMediator",
            "nativeMethod": false,
            "lineNumber": 206
          },
          {
            "fileName": "DefaultExecutionMediator.java",
            "methodName": "executeWithInterceptors",
            "className": "org.mule.runtime.module.extension.internal.runtime.operation.DefaultExecutionMediator",
            "nativeMethod": false,
            "lineNumber": 190
          },
          {
            "fileName": "DefaultExecutionMediator.java",
            "methodName": "lambda\$execute\$1",
            "className": "org.mule.runtime.module.extension.internal.runtime.operation.DefaultExecutionMediator",
            "nativeMethod": false,
            "lineNumber": 109
          },
          {
            "fileName": "DefaultExecutionMediator.java",
            "methodName": "lambda\$new\$0",
            "className": "org.mule.runtime.module.extension.internal.runtime.operation.DefaultExecutionMediator",
            "nativeMethod": false,
            "lineNumber": 59
          },
          {
            "fileName": "DefaultExecutionMediator.java",
            "methodName": "execute",
            "className": "org.mule.runtime.module.extension.internal.runtime.operation.DefaultExecutionMediator",
            "nativeMethod": false,
            "lineNumber": 108
          },
          {
            "fileName": "ComponentMessageProcessor.java",
            "methodName": "executeOperation",
            "className": "org.mule.runtime.module.extension.internal.runtime.operation.ComponentMessageProcessor",
            "nativeMethod": false,
            "lineNumber": 483
          },
          {
            "fileName": "OAuthOperationMessageProcessor.java",
            "methodName": "executeOperation",
            "className": "org.mule.runtime.module.extension.internal.runtime.operation.OAuthOperationMessageProcessor",
            "nativeMethod": false,
            "lineNumber": 58
          },
          {
            "fileName": "ComponentMessageProcessor.java",
            "methodName": "prepareAndExecuteOperation",
            "className": "org.mule.runtime.module.extension.internal.runtime.operation.ComponentMessageProcessor",
            "nativeMethod": false,
            "lineNumber": 666
          },
          {
            "fileName": "ComponentMessageProcessor.java",
            "methodName": "lambda\$onEventSynchronous\$19",
            "className": "org.mule.runtime.module.extension.internal.runtime.operation.ComponentMessageProcessor",
            "nativeMethod": false,
            "lineNumber": 437
          },
          {
            "fileName": "ComponentMessageProcessor.java",
            "methodName": "onEventSynchronous",
            "className": "org.mule.runtime.module.extension.internal.runtime.operation.ComponentMessageProcessor",
            "nativeMethod": false,
            "lineNumber": 440
          },
          {
            "fileName": "ComponentMessageProcessor.java",
            "methodName": "lambda\$null\$9",
            "className": "org.mule.runtime.module.extension.internal.runtime.operation.ComponentMessageProcessor",
            "nativeMethod": false,
            "lineNumber": 358
          },
          {
            "fileName": "FluxPeekFuseable.java",
            "methodName": "onNext",
            "className": "reactor.core.publisher.FluxPeekFuseable\$PeekFuseableConditionalSubscriber",
            "nativeMethod": false,
            "lineNumber": 482
          },
          {
            "fileName": "FluxMapFuseable.java",
            "methodName": "onNext",
            "className": "reactor.core.publisher.FluxMapFuseable\$MapFuseableConditionalSubscriber",
            "nativeMethod": false,
            "lineNumber": 287
          },
          {
            "fileName": "FluxPeekFuseable.java",
            "methodName": "onNext",
            "className": "reactor.core.publisher.FluxPeekFuseable\$PeekFuseableConditionalSubscriber",
            "nativeMethod": false,
            "lineNumber": 496
          },
          {
            "fileName": "AbstractMessageProcessorChain.java",
            "methodName": "onNext",
            "className": "org.mule.runtime.core.privileged.processor.chain.AbstractMessageProcessorChain\$2",
            "nativeMethod": false,
            "lineNumber": 425
          },
          {
            "fileName": "AbstractMessageProcessorChain.java",
            "methodName": "onNext",
            "className": "org.mule.runtime.core.privileged.processor.chain.AbstractMessageProcessorChain\$2",
            "nativeMethod": false,
            "lineNumber": 420
          },
          {
            "fileName": "FluxHide.java",
            "methodName": "onNext",
            "className": "reactor.core.publisher.FluxHide\$SuppressFuseableSubscriber",
            "nativeMethod": false,
            "lineNumber": 127
          },
          {
            "fileName": "FluxPeekFuseable.java",
            "methodName": "onNext",
            "className": "reactor.core.publisher.FluxPeekFuseable\$PeekFuseableSubscriber",
            "nativeMethod": false,
            "lineNumber": 204
          },
          {
            "fileName": "FluxOnAssembly.java",
            "methodName": "onNext",
            "className": "reactor.core.publisher.FluxOnAssembly\$OnAssemblySubscriber",
            "nativeMethod": false,
            "lineNumber": 345
          },
          {
            "fileName": "FluxSubscribeOnValue.java",
            "methodName": "run",
            "className": "reactor.core.publisher.FluxSubscribeOnValue\$ScheduledScalar",
            "nativeMethod": false,
            "lineNumber": 178
          },
          {
            "fileName": "SchedulerTask.java",
            "methodName": "call",
            "className": "reactor.core.scheduler.SchedulerTask",
            "nativeMethod": false,
            "lineNumber": 50
          },
          {
            "fileName": "SchedulerTask.java",
            "methodName": "call",
            "className": "reactor.core.scheduler.SchedulerTask",
            "nativeMethod": false,
            "lineNumber": 27
          },
          {
            "fileName": "FutureTask.java",
            "methodName": "run",
            "className": "java.util.concurrent.FutureTask",
            "nativeMethod": false,
            "lineNumber": 266
          },
          {
            "fileName": "AbstractRunnableFutureDecorator.java",
            "methodName": "doRun",
            "className": "org.mule.service.scheduler.internal.AbstractRunnableFutureDecorator",
            "nativeMethod": false,
            "lineNumber": 111
          },
          {
            "fileName": "RunnableFutureDecorator.java",
            "methodName": "run",
            "className": "org.mule.service.scheduler.internal.RunnableFutureDecorator",
            "nativeMethod": false,
            "lineNumber": 54
          },
          {
            "fileName": "ThreadPoolExecutor.java",
            "methodName": "runWorker",
            "className": "java.util.concurrent.ThreadPoolExecutor",
            "nativeMethod": false,
            "lineNumber": 1149
          },
          {
            "fileName": "ThreadPoolExecutor.java",
            "methodName": "run",
            "className": "java.util.concurrent.ThreadPoolExecutor\$Worker",
            "nativeMethod": false,
            "lineNumber": 624
          },
          {
            "fileName": "Thread.java",
            "methodName": "run",
            "className": "java.lang.Thread",
            "nativeMethod": false,
            "lineNumber": 748
          }
        ],
        "suppressed": []
      },
      "message": "Required fields are missing: [Contact__c]",
      "payload": {
        "created": true,
        "success": false,
        "id": null,
        "errors": [
          {
            "duplicateResult": null,
            "message": "Required fields are missing: [Contact__c]",
            "fields": [
              "Contact__c"
            ],
            "statusCode": "REQUIRED_FIELD_MISSING"
          }
        ]
      },
      "id": null,
      "statusCode": "REQUIRED_FIELD_MISSING",
      "successful": false
    }
  ],
  "successful": false
}
---
title: "Questões da prova"
weight: 3
---

**Compute:**

- Quando usar um NLB versus um ALB, por exemplo, requisitos para lista branca de endereços IP. 
- Quais modelos de preços de computação usar para um determinado cenário. 
- Como dimensionar para desempenho - opções Amazon EC2, AWS Lambda, Amazon ECS. 
- Opções de implantação para escalonamento automático com instâncias, contêineres e sem servidor. Refatorar aplicativos para micro serviços ou arquiteturas sem servidor. 

**Storage:**

- Escolher a melhor arquitetura de armazenamento para requisitos específicos, casos de uso de objetos, blocos, arquivos, HPC etc. 
- Amazon S3, Amazon EFS, AWS Storage Gateway, Amazon FSx (para servidor de arquivos do Windows ou Lustre).
- Características de desempenho de diferentes opções de armazenamento, camadas, classes e tipos de volume. 

**Database:**

- Quando usar bancos de dados relacionais versus não relacionais - Amazon DynamoDB, Amazon Aurora (mais do que RDS agora).
- Como refatorar bancos de dados existentes para serviços gerenciados da AWS. 
- Usando soluções de cache para desempenho - DynamoDB DAX, Amazon ElastiCache.
- Dimensionando o desempenho de leitura, multi-AZ, multi-região e bancos de dados multiativos. 
- Usando data warehouses (Amazon RedShift) e bancos de dados de gráficos (Amazon Neptune). 

**Migration and Transfer:**

- Como usar o serviço de descoberta de aplicativos para planejar migrações. 
- Migrando de servidores físicos, Microsoft Hyper-V e VMware local. 
- Usando o Migration Hub. 
- Migrando com AWS SMS, DMS, SCT e DataSync. 
- Quando você precisa converter esquemas com SCT, por exemplo, Oracle para DynamoDB. 
- Quando você precisa usar a família Snow de dispositivos versus migrações online. 

**Networking and Content Delivery:**

- Familiaridade sólida com Amazon VPC, incluindo blocos IP CIDR, sub-redes e tabelas de roteamento.
- Quando usar um Gateway NAT ou instância NAT e como implantar corretamente. 
- Arquitetura de endpoint VPC e como implantar gateways e endpoints de interface.
- Usando políticas para restringir o acesso por endpoints. 
- Melhores práticas e casos de uso para grupos de segurança e NACL. 
- Route 53 para resolução e direcionamento de tráfego. 
- Deve conhecer as opções de roteamento e casos de uso. 
- Quando usar o AWS Direct Connect e como implantar redundante (e como adicionar criptografia). 
- Arquitetura e casos de uso para AWS VPN, AWS Transfer Gateway e AWS Direct Connect gateway. 
- Opções de implantação do API Gateway e otimizações de desempenho. 
- AWS Global Accelerator e Amazon CloudFront - conheça os casos de uso e diferenças. 

**Developer Tools:**

- Compreenda todo o pipeline CI / CD e como cada ferramenta se encaixa - AWS CodeBuild, CodeCommit, CodeDeploy, CodePipeline. 
- Como implementar um CodePipeline com Github (webhooks) e Jenkins e outras ferramentas semelhantes. 
- Rastreamento com AWS X-Ray. 
- Compreenda as várias opções de implantação e quando usá-las, por exemplo, in-place, tudo de uma vez, canário, azul / verde. 

**Management and Governance:**

- AWS Organizations SCPs - saiba toda a estrutura de aplicação de SCPs e a herança (vale muitos pontos!).

- Conheça seu CloudFormation e como usar StackSets e Change Sets. 

- AWS Auto Scaling para serviços relevantes. 

- Saiba quais métricas você pode obter com o CloudWatch e quando você precisa de métricas personalizadas.

- Saiba o que capturar com o CloudTrail e como usar o EventBridge ou CloudWatch Alarms/Events para reagir. 

- Casos de uso do Systems Manager Parameter Store e serviços de patching. 

- Service Catalog e como compartilhar portfólios na AWS Organizations. 

- Casos de uso do OpsWorks e opções de implantação.

  

**Machine Learning:**

- Algumas perguntas aleatórias incluem coisas como Transcribe e Rekognition - apenas saiba para que esses serviços são usados e como eles podem se encaixar em arquiteturas de solução.

**Analytics:**

- Saiba como analisar dados de várias fontes, como datalakes no S3 ou Kinesis Data Streams. 
- Athena, RedShift, EMR, Elasticsearch, Kinesis, QuickSight, AWS Glue.

**Security, identity and compliance:**

- Conheça bem suas políticas IAM. 
- Como habilitar o acesso entre contas com funções + ID externo. 
- AWS Directory Service. 
- Casos de uso do Secrets Manager.
- AWS Single Sign-on e Cognito - saiba os casos de uso para esses serviços. 
- KMS, Certificate Manager, CloudHSM.
- Implementação do AWS WAF - saiba o que você pode fazer e com quais tipos de recursos você pode usá-lo.
- Defesa em profundidade usando WAF, grupos de segurança, NACLs e outras medidas de segurança. 
- Usando Shield e outras técnicas de mitigação de DDoS.

**Front-end Web and Mobile:**

- Casos de uso para o AWS AppSync.

**Application Integration:**

- Saiba quando usar cada serviço, incluindo SQS, SNS, SWF e Step Functions. 
- Casos de uso para o Amazon MQ, como migrar aplicativos existentes usando esses protocolos. Amazon EventBridge para coordenar fluxos de mensagens entre serviços. 
- Opções de dimensionamento com ASG e SQS.

**Cost management:**

- Usando a AWS Organizations para faturamento centralizado. 
- Tags de alocação de custos. 
- Como relatar custos para centros de custos individuais. 
- Usando diferentes planos de economia e opções de reserva.

**End-user computing:**

- WorkSpaces e AppStream - saiba o que são.

**Internet of things:**

- Opções de implantação e casos de uso do IoT Core.
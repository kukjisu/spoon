
[설명]

3개의 작업 폴더 (vpc, eks, kubernetes)로 구분하였습니다. 각 tfstate 파일은 S3에 별도 설정 되어 있습니다. 모든 폴더는 data 및 output 블록을 통해 서로 자원을 참조하고 있습니다.

※최대한 공식 레퍼런스 및 Google 기술문서 기반으로 활용하였으며 흥미롭게 진행할 수 있었고 다시 배움의 과정에 있어 좋은 기회였습니다.

[vpc]

AWS vpc 모듈을 사용하여 public, private subnet 구성 및 각 private subnet은 외부 경로로 각각의 NAT 설정을 진행하였습니다. AZ는 ap-northeast-2a, ap-northeast-2c 로 2개의 가용 영역을 사용하였습니다.

[eks]

AWS eks 모듈을 사용하여 "1.32" Ver의 EKS Cluster을 구성하였습니다. 네트워크 구성은 Private 으로 구성하였으며 Affinity 설정을 위한 labels (private='was') 구성을 하였습니다. 별도의 Custom Node로는 구성하지 않았고 Managed Node로 인스턴스 유형은 'm5.large'로 구성했습니다.

[kubernetes]

Terraform을 통해 alb-lb-controller를 helm Chart로 구성하였고 Ver(1.9.2), SA, IRSA, Controller 구성파일로 분리하였습니다. Ingress 및 Deployment, SVC도 Terraform으로 구성하였고 언급된 Spring Boot Image는 "start.spring.io/starter.zip"을 통해 다운로드 및 구성하고 "mvnw package -DskipTests'로 JAR 빌드, Docker File 생성 후 build 하여 ECR에 업로드하였습니다. Deployment의 Image Tag 및 Affinity 설정으로 특정 Private Node에서 동작할 수 있게 설정하였습니다.

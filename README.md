##  Módulo iac-modulo-compute-cluster-gcp
Este repositório permite a criação de um cluster na Google Cloud Platform (GCP).

## Requisitos

| Name | Version |
|------|---------|
| Terraform | >= 1.0.0 |

## Providers
  
| Name | Version |
|------|---------|
| hashicorp/google | >= 3.81.0 |

## Entradas

| Nome | Descrição | Tipo | Valor padrão | Obrigatório |
|------|-------------|------|---------|:--------:|
| project_id | ID do projeto onde será criado o cluster | `string` | - | sim |
| name | Nome do cluster | `string` | - | sim |
| region | Região do cluster | `string` | - | sim |
| network | Rede do cluster | `string` | - | sim |
| subnetwork | Sub-rede do cluster | `string` | - | sim |
| node_pools | Lista descrevendo os componentes do cluster | `list(object)*` | - | sim |

\* A lista de componentes do cluster, ou o parâmetro _node_pools_, deve conter Objetos descritos pelos seguintes atributos:

```hcl
object {
  number_of_compute = number
  name              = string
  instance_image    = string
  machine_type      = string
  labels            = map(string)
}
```

### Atributos do Objeto _node_pools_ 

| Nome | Descrição | Tipo | Valor padrão | Obrigatório |
|------|-------------|------|---------|:--------:|
| number_of_nodes | Número de instâncias | `number` | - | sim |
| name | Nome do componente do cluster | `string` | - | sim |
| instance_image | Image usada na criação da instância | `string` | - | sim |
| metadata_startup_script | Script executado na incialização das instâncias | `string` | - | não |
| machine_type | Tipo (ou tamanho) da instância  | `string` | - | sim |
| labels | Labels que serão associados às instâncias | `map(string)` | - | sim |

## Outputs (TODO)

| Name | Description |
|------|-------------|
| ferramentas | exemplo de saida |

## Testar localmente

Para testar localmente este módulo, seguir os passos abaixo:

1. Clonar o repositório:
```shell
git clone git@github.com:mentoriaiac/iac-modulo-compute-cluster-gcp.git
```

2. Navegar até o diretório de exemplo do módulo:
```shell
cd iac-modulo-compute-cluster-gcp/how-to-use-this-module/
```

3. Executar o exemplo do módulo:
```shell
# Plano de execução do módulo
make plan
# Aplicação do módulo para criação de recursos
make apply
# Destruição dos recursos criados pelo módulo
make destroy
```
  

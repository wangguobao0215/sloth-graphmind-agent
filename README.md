<div align="center">

<img src="GraphMind Logo.png" alt="GraphMind" width="420"/>

### 树懒图灵 · GraphMind Agent

#### Graph-Native Infrastructure for Context and Accountable AI Systems
#### AI Agent 的知识图谱与决策智能基础设施

> 接入企业数据，提取关键信息，构建上下文图谱与知识图谱（KG），在其上运行图谱分析与因果推理，并内建完整的决策溯源能力。可解释、可追溯、可信赖。

**决策智能 &nbsp;·&nbsp; 上下文管理 &nbsp;·&nbsp; 确定性推理 &nbsp;·&nbsp; 本体管理 &nbsp;·&nbsp; 知识建模 &nbsp;·&nbsp; 端到端溯源**

**开源 &nbsp;·&nbsp; 可自托管 &nbsp;·&nbsp; 可审计 &nbsp;·&nbsp; 可治理 &nbsp;·&nbsp; 零供应商锁定**

**多态图谱存储 &nbsp;·&nbsp; RDF & LPG 双支持 &nbsp;·&nbsp; W3C 标准 &nbsp;·&nbsp; 可互操作**

#### 为高风险、强监管领域而生

[![GitHub Stars](https://img.shields.io/github/stars/wangguobao0215/sloth-graphmind-agent?style=flat-square&color=FFD700&logo=github&logoColor=white&label=Stars)](https://github.com/wangguobao0215/sloth-graphmind-agent) [![GitHub Forks](https://img.shields.io/github/forks/wangguobao0215/sloth-graphmind-agent?style=flat-square&color=6E40C9&logo=github&logoColor=white&label=Forks)](https://github.com/wangguobao0215/sloth-graphmind-agent/network/members) [![Contributors](https://img.shields.io/github/contributors/wangguobao0215/sloth-graphmind-agent?style=flat-square&color=2EA043&logo=github&logoColor=white)](https://github.com/wangguobao0215/sloth-graphmind-agent/graphs/contributors) [![PyPI](https://img.shields.io/pypi/v/sloth_graphmind.svg?style=flat-square&color=0066CC&logo=pypi&logoColor=white)](https://pypi.org/project/sloth_graphmind/) [![Total Downloads](https://static.pepy.tech/badge/sloth_graphmind?style=flat-square)](https://pepy.tech/project/sloth_graphmind) [![Python 3.8+](https://img.shields.io/badge/python-3.8+-3776AB?style=flat-square&logo=python&logoColor=white)](https://www.python.org/) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](https://opensource.org/licenses/MIT)

```bash
pip install sloth_graphmind
```

</div>

---

## 关于树懒图灵

**树懒图灵（Sloth-GraphMind-Agent）** 是 Sloth 家族旗下的智能体产品，为 AI Agent 提供图原生（Graph-Native）基础设施层。

大多数 AI Agent 行动时不留痕迹——它们存储的是嵌入向量，而非语义；是无法解释的上下文，是无法审计的决策。在金融风控、医疗诊断、法律合规等场景中，这种缺失不是不便，而是合规风险。

树懒图灵位于你的 LLM、向量数据库和 Agent 框架之下，作为确定性基础设施层存在：**图谱构建、推理、溯源均无需 LLM 参与**。

### 适用场景

- **AI/ML 平台团队**：交付需要做关键决策的 Agent，需要从碎片化原始数据构建结构化、可查询的上下文，而非仅仅依赖向量索引
- **数据平台团队**：将已存在于 Databricks Unity Catalog 或 Snowflake 仓库中的表转化为受治理、有血缘追踪的知识图谱，无需先导出数据到第三方 SaaS
- **合规、风控与审计团队**：需要以监管可接受的格式回答"AI 为什么这么做"
- **强监管企业**（金融、医疗、法律、政府、国防）：不能交付黑箱，也不能将数据发送到他人 SaaS 来获取黑箱
- **平台与基础设施工程师**：希望 KG、推理和溯源栈可自托管、可替换，而非锁定在单一供应商后端
- **数据与知识工程师**：从混乱的多源数据构建 KG——实体和关系被抽取，冲突或矛盾的事实被标记而非静默覆盖，重复项在变成噪音前被合并

### 核心能力

- **上下文图谱（Context Graphs）**：Agent 所知、所决、所推理的一切，构成结构化、可查询的图谱
- **决策智能（Decision Intelligence）**：每个决策都是一等公民——可追溯、可按先例搜索、因果关联
- **AI 治理与本体**：SHACL 约束、冲突检测、合规规则、OWL 生成、SKOS 词汇管理，配可视化编辑器
- **完整可审计性**：每个事实均有 W3C PROV-O 溯源，审计轨迹可导出为 JSON、CSV 或 RDF
- **确定性推理**：前向链、Rete 网络、Datalog、SPARQL，路径完全可解释，非黑箱
- **知识流水线**：多源接入、实体感知分块、NER/关系/事件抽取、知识图谱构建，全程语义去重与溯源保留合并
- **企业数据平台**：Databricks（Unity Catalog + Delta Lake）和 Snowflake 原生连接器
- **图谱分析**：中心性、社区发现、链接预测、最短路径查询
- **多态图谱存储**：RDF（Oxigraph、Blazegraph、Apache Jena、Eclipse RDF4J）和标签属性图（Neo4j、FalkorDB、Apache AGE、AWS Neptune），以及向量存储，均可无缝切换
- **可视化**：在交互式浏览器工作台中探索任意图谱、本体或时间线
- **即插即用集成**：原生 Agno 支持、完整 MCP 服务器、全面 CLI、REST API、主流编辑器插件

---

## 快速开始

```bash
pip install sloth_graphmind
```

```python
from sloth_graphmind.context import ContextGraph

graph = ContextGraph(advanced_analytics=True)

# 每个 Agent 决策都成为可查询、可审计的知识节点
decision_id = graph.record_decision(
    category="vendor_selection",
    scenario="为 HIPAA 工作负载选择云服务商",
    reasoning="AWS 提供 BAA、成熟的 HIPAA 工具链和现有团队经验",
    outcome="selected_aws",
    confidence=0.93,
)

# 问"为什么会这样"，得到真正的结构化答案
chain     = graph.trace_decision_chain(decision_id)       # 完整因果祖先链
similar   = graph.find_similar_decisions("cloud vendor", max_results=5)  # 先例
impact    = graph.analyze_decision_impact(decision_id)    # 下游影响图
compliant = graph.check_decision_rules({"category": "vendor_selection"})  # 策略门
```

**5 秒验证安装：**

```bash
graphmind doctor
# Python 3.11.9         pass
# graphmind 0.6.5       pass
# faiss vector store    pass
# Config file           pass    ~/.graphmind/config.yaml
```

---

## 架构

树懒图灵是真正的端到端流水线，不是单个库加一个营销名称。以下每个阶段都是独立可导入的模块：

```
数据源 → 接入 → 解析 → 标准化 → 分块 → 抽取 → 冲突检测 → 去重
   → 知识图谱 → [ 本体 · 推理 · 溯源 · 决策 ] → 增强图谱
   → 向量存储 + 多态图谱存储（RDF & LPG）→ 导出 / 可视化 / REST · MCP · CLI
```

- **接入（Ingest）**：文件、网页、数据库、企业数据平台（Databricks、Snowflake）、云（Google Drive、Elasticsearch）、流（Kafka、Kinesis）、Git、邮件、MCP
- **解析 → 标准化 → 分块**：文档解析、文本/实体/日期标准化、GraphRAG 原生实体感知分块
- **抽取 → 冲突检测 → 去重**：NER、关系、事件、三元组；冲突事实在合并前被标记和解决
- **知识图谱**：`GraphBuilder` 构建图谱；双时间事实和完整图谱分析（中心性、社区、链接预测）在其上运行
- **本体 · 推理 · 溯源 · 决策**：坐在 KG 之上的智能层，SHACL/OWL 治理、Rete/Datalog/SPARQL 推理、W3C PROV-O 血缘、一等决策记录
- **存储**：多态设计，RDF 三元组存储（嵌入式 Oxigraph、Blazegraph、Apache Jena、Eclipse RDF4J）、标签属性图（Neo4j、FalkorDB、Apache AGE、AWS Neptune）和向量存储，均可无缝切换
- **输出**：导出（RDF、OWL、Parquet、Cypher、JSON-LD）、交互式可视化，以及通过 REST API、MCP 服务器或 CLI 访问

**→ [流水线和决策智能生命周期的完整 Mermaid 图](ARCHITECTURE.md)**

---

## 决策智能

决策智能将每个 AI 选择从短暂的推理转化为永久的、可审计的、可查询的记录。它回答*"你的 AI 决定了什么、为什么、接下来发生了什么"*——这是监管者和企业风险团队越来越紧迫的问题。

在树懒图灵中，决策不是日志行。它是具有完整生命周期的一等图谱节点。在受监管领域，每个 AI 决策必须可追溯到源头并可向审计员辩护：`record_decision()` 创建永久的、结构化的记录，可导出为 W3C PROV-O——大多数合规框架接受用于监管提交的格式。

```
record_decision()             → 存储为具有完整结构化上下文的图谱节点
add_causal_relationship()     → 链接到上游原因和下游影响
find_similar_decisions()      → 跨所有历史决策的语义先例搜索
trace_decision_chain()        → 回到根本原因的完整因果祖先链
analyze_decision_impact()     → 下游影响图 - 此决策影响的一切
check_decision_rules()        → 针对可配置规则集的策略合规门
export / audit trail          → W3C PROV-O、CSV 或 JSON 用于监管提交
```

```python
from sloth_graphmind.context import ContextGraph

graph = ContextGraph(advanced_analytics=True)

# 记录具有完整结构化上下文的决策
app_id = graph.record_decision(
    category="credit_application",
    scenario="个人贷款，$85k 收入，31% DTI，3 年雇佣",
    reasoning="收入达到阈值；雇佣稳定；无不良信用事件",
    outcome="proceed_to_underwriting",
    confidence=0.88,
    metadata={"applicant_id": "A-7291"},
)
uw_id = graph.record_decision(
    category="loan_underwriting",
    scenario="A-7291 的承保审查",
    reasoning="DTI 在策略内；36 个月信用历史干净",
    outcome="approved",
    confidence=0.94,
)
rate_id = graph.record_decision(
    category="interest_rate",
    scenario="批准贷款 A-7291 的利率分配",
    outcome="rate_set_8.9pct",
    reasoning="基于风险等级 B2 的 Prime + 2.4%",
    confidence=0.99,
)

# 构建可审计的因果链
graph.add_causal_relationship(app_id, uw_id,   relationship_type="CAUSED")
graph.add_causal_relationship(uw_id,  rate_id, relationship_type="INFLUENCED")

# 查询智能
chain     = graph.trace_decision_chain(rate_id)
similar   = graph.find_similar_decisions("personal loan approval, 31% DTI", max_results=5)
impact    = graph.analyze_decision_impact(uw_id)
compliant = graph.check_decision_rules({"category": "loan_underwriting", "confidence": 0.94})
insights  = graph.get_decision_insights()
```

---

## 上下文图谱

上下文图谱是传统 RAG 缺失的结构化记忆层。上下文图谱不回答*"什么是相似的"*（扁平嵌入），而是回答*"什么是连接的、为什么、如何连接的"*。每个实体、关系、决策和事实都是一等节点，可通过图谱遍历查询。实体链接到源文档，决策链接到证据和后果，事实携带完整溯源，冲突被检测而非静默覆盖。

```python
from sloth_graphmind.context import ContextGraph, AgentContext
from sloth_graphmind.vector_store import VectorStore

graph = ContextGraph(advanced_analytics=True)

# 添加具有类型化属性的节点
graph.add_node("acme_corp",    "Organization", name="Acme Corp", industry="SaaS")
graph.add_node("alice_chen",   "Person",       name="Alice Chen", role="CTO")
graph.add_node("contract_001", "Contract",     value=2_400_000, currency="USD")

# 添加类型化、带权重的边（额外 kwargs 成为边元数据）
graph.add_edge("alice_chen", "acme_corp",    edge_type="works_for",  since="2019-03-01")
graph.add_edge("acme_corp",  "contract_001", edge_type="party_to",   signed="2024-01-15")

# BFS 遍历 - 从任意节点跳跃图谱
neighbors = graph.get_neighbors("acme_corp", hops=2)

# 时间点快照 - 图谱在过去任意日期的状态
snapshot  = graph.state_at("2024-01-01")

# AgentContext - Agent 记忆工作流的高级 API
vs  = VectorStore(backend="faiss")
ctx = AgentContext(vector_store=vs, knowledge_graph=graph)
ctx.store("Alice 在 2024 年 Q1 批准了 Acme 续约", conversation_id="conv_001")
retrieved = ctx.retrieve("谁批准了 Acme 合同？")
```

**为什么用图谱而非嵌入：** 遍历发现嵌入错过的连接（距离合同 3 跳的人）；每个节点携带溯源，所以你总能问*"这来自哪里"*；冲突在污染知识库前被标记；时间点快照让你无需重新处理即可重放历史。

---

## 为什么选择树懒图灵

| | 向量数据库 + RAG | 纯 LLM 记忆 | **树懒图灵** |
| --- | --- | --- | --- |
| **召回方法** | 嵌入相似度 | Token 窗口 | 图谱遍历 + 语义搜索 |
| **决策历史** | 不存储 | 不存储 | 一等可查询对象 |
| **溯源** | 无 | 无 | W3C PROV-O，源链接 |
| **推理** | 无 | 黑箱 | 前向链、Rete、Datalog、SPARQL |
| **冲突检测** | 静默覆盖 | 静默覆盖 | 检测、标记、解决 |
| **时间旅行** | 无 | 无 | 时间点图谱快照 |
| **合规导出** | 无 | 无 | PROV-O、SHACL、OWL、RDF |
| **策略执行** | 无 | 无 | 内置规则引擎 + SHACL |
| **实体解析** | 无 | 无 | 阻塞 + 语义去重 |
| **多 Agent 上下文** | 每 Agent 分离 | 每 Agent 分离 | 单一共享智能层 |

树懒图灵补充而非替换你现有的栈。保持你的 LLM、向量存储和 Agent 框架不变；树懒图灵在其上添加决策记录、因果推理、溯源、本体治理、冲突检测和审计轨迹。推理引擎、KG 构建和溯源层完全是确定性的；使用它们不需要 LLM。

---

## 模块参考

| 模块 | 说明 |
|------|------|
| `sloth_graphmind.ingest` | 多源数据接入（文件、网页、数据库、流、Git、邮件、MCP） |
| `sloth_graphmind.parse` | 文档解析（PDF、DOCX、PPTX、HTML、CSV、JSON、Excel、XML、代码） |
| `sloth_graphmind.normalize` | 文本/实体/日期/数字标准化、数据清洗、语言检测 |
| `sloth_graphmind.split` | 实体感知、关系感知、图谱感知、本体感知、层次化分块 |
| `sloth_graphmind.semantic_extract` | NER、关系抽取、事件检测、三元组抽取、共指消解 |
| `sloth_graphmind.conflicts` | 冲突检测、解决、源追踪 |
| `sloth_graphmind.deduplication` | 重复检测、实体合并 |
| `sloth_graphmind.kg` | 图谱构建、实体解析、双时间事实、图谱分析 |
| `sloth_graphmind.ontology` | 本体生成、验证、OWL、SHACL、SKOS |
| `sloth_graphmind.reasoning` | Rete 引擎、Datalog、SPARQL、解释生成 |
| `sloth_graphmind.provenance` | W3C PROV-O 溯源管理 |
| `sloth_graphmind.context` | 上下文图谱、Agent 上下文、决策记录、因果分析、策略引擎 |
| `sloth_graphmind.vector_store` | FAISS、Qdrant、Weaviate、Milvus、Pinecone、PgVector、混合搜索 |
| `sloth_graphmind.graph_store` | Neo4j、FalkorDB、Apache AGE、AWS Neptune |
| `sloth_graphmind.triplet_store` | Oxigraph、Blazegraph、Apache Jena、Eclipse RDF4J |
| `sloth_graphmind.export` | RDF、OWL、Parquet、Cypher、JSON-LD、CSV、GraphML、ArangoDB AQL |
| `sloth_graphmind.visualization` | KG 可视化、本体可视化、嵌入可视化、时间可视化 |
| `sloth_graphmind.mcp_server` | MCP 服务器（10+ 工具） |
| `sloth_graphmind.server` | REST API（100+ 端点） |
| `sloth_graphmind.cli` | CLI（50+ 命令） |
| `sloth_graphmind.explorer` | 知识图谱浏览器（Web 工作台） |

---

## CLI 命令

```bash
# 健康检查
graphmind doctor

# 初始化配置
graphmind init

# 数据接入
graphmind ingest ./reports/q1.pdf
graphmind ingest ./data/ --recursive --format csv

# 文档解析
graphmind parse contract.pdf | jq '.entities'

# 文本分块
graphmind split report.pdf --strategy semantic --chunk-size 256

# 知识抽取
graphmind extract "Alice signed the contract with Acme Corp."
graphmind extract report.pdf --mode triplets --method llm

# 图谱构建
graphmind kg build

# 推理
graphmind reason run --engine rete --rules business-rules.yaml
graphmind reason explain "Alice is-manager-of Engineering"

# 决策记录
graphmind decision record --title "Approve vendor X" --tags "finance,vendor"
graphmind decision trace dec_abc123 --format mermaid

# 本体管理
graphmind ontology generate --domain healthcare --output healthcare.ttl

# 导出
graphmind export --format turtle --output graph.ttl
graphmind export --format parquet --with-provenance

# 服务
graphmind server start --port 8000
graphmind explorer start --port 5173
graphmind mcp start --transport http --port 3000

# 交互式 REPL
graphmind shell
```

---

## 集成

### Agent 框架
- **Agno**：原生支持，共享上下文、知识图谱工具包、决策套件
- **LangChain / LangGraph**：通过标准接口集成
- **CrewAI**：多 Agent 协作上下文共享
- **LlamaIndex**：知识图谱索引器
- **AutoGen**：多 Agent 对话上下文
- **OpenAI Agents SDK**：决策溯源集成
- **Google ADK**：Agent 开发工具包集成

### MCP 客户端
- **Claude Desktop**：通过 MCP 协议访问图谱和决策
- **GitHub Copilot**：代码上下文图谱
- **Cursor**：项目知识图谱
- **VS Code**：通过 MCP 扩展
- **Windsurf**：AI IDE 集成
- **Cline / Roo Code / Kilo Code / Aider**：AI 编码助手

### 数据平台
- **Databricks**：Unity Catalog + Delta Lake 原生连接器
- **Snowflake**：Warehouse/Database/Schema 原生连接器
- **PostgreSQL / MySQL / SQLite / Oracle / DuckDB / MongoDB**：数据库接入
- **Google Drive / Elasticsearch / HuggingFace**：云和 AI 平台
- **Kafka / RabbitMQ / AWS Kinesis / Pulsar**：流数据接入

---

## 安装

```bash
# 基础安装
pip install sloth_graphmind

# 带可视化支持
pip install sloth_graphmind[viz]

# 带基础设施支持（Databricks、Snowflake）
pip install sloth_graphmind[infra]

# 带所有 LLM 支持
pip install sloth_graphmind[llm-all]

# 开发安装
git clone https://github.com/wangguobao0215/sloth-graphmind-agent.git
cd sloth-graphmind-agent
pip install -e ".[dev]"
```

---

## 性能

- **图谱构建**：每秒处理数千个实体和关系
- **推理**：Rete 引擎支持百万级规则匹配
- **向量搜索**：FAISS 支持十亿级向量毫秒级检索
- **溯源**：W3C PROV-O 导出支持百万级实体血缘追踪

---

## 贡献

欢迎贡献！请参阅 [CONTRIBUTING.md](CONTRIBUTING.md) 了解如何参与。

---

## 许可证

MIT License — 详见 [LICENSE](LICENSE) 文件。

---

## 致谢

本项目基于 [Semantica](https://github.com/semantica-agi/semantica) 项目 fork 并增强开发，感谢原项目的贡献者们。

---

<div align="center">

**树懒图灵 · 慢一点，深一度**

[⭐ Star on GitHub](https://github.com/wangguobao0215/sloth-graphmind-agent)

</div>

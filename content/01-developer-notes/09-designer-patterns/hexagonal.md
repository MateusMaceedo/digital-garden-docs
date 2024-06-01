---
title: "Hexagonal Architecture"
weight: 2
---

***Abaixo esta o diagrama UML da arquitetura Hexagonal***


```.puml

@startuml
skinparam linetype ortho
skinparam titleFontName Calibri
skinparam titleFontSize 23
skinparam titleFontColor Black
title Arquitetura Hexagonal

package "Core Application" {
    [Domain Service] as DS
    [Application Service] as AS
    [Domain Model] as DM
    DS --> AS
    AS --> DM
}

package "Primary Adapters" {
    [User Interface] as UI
    [Primary Port] as PP
    UI --> PP
    PP --> AS
}

package "Secondary Adapters" {
    [Database] as DB
    [External API] as API
    [Secondary Port] as SP1
    [Secondary Port] as SP2
    AS --> SP1
    AS --> SP2
    SP1 --> DB
    SP2 --> API
}

@enduml

```

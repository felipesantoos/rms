package rms

class BootStrap {
    PriorityService priorityService
    ProjectService projectService
    RequirementService requirementService
    RequirementOriginService requirementOriginService
    RequirementTypeService requirementTypeService

    def init = { servletContext ->
        loadPriorities()
        loadRequirementOrigins()
        loadRequirementTypes()
    }
    def destroy = {
    }

    private void loadPriorities() {
        if (Priority.count() == 0) {
            ArrayList<Priority> priorities = [
                    new Priority(level: "Alta", color: "#f08080"),
                    new Priority(level: "Média", color: "#ffff00"),
                    new Priority(level: "Baixa", color: "#89cff0")
            ]
            priorities.forEach {Priority priority ->
                priorityService.save(priority)
            }
        }
    }

    private void loadRequirementOrigins() {
        if (RequirementOrigin.count() == 0) {
            ArrayList<RequirementOrigin> requirementOrigins = [
                    new RequirementOrigin(name: "Requisito de projeto"),
                    new RequirementOrigin(name: "Requisito organizacional"),
                    new RequirementOrigin(name: "Requisito externo")
            ]
            requirementOrigins.forEach {RequirementOrigin requirementOrigin ->
                requirementOriginService.save(requirementOrigin)
            }
        }
    }

    private void loadRequirementTypes() {
        if (RequirementType.count() == 0) {
            ArrayList<RequirementType> requirementTypes = [
                    new RequirementType(name: "Funcional"),
                    new RequirementType(name: "Não funcional"),
                    new RequirementType(name: "Regra de negócio")
            ]
            requirementTypes.forEach {RequirementType requirementType ->
                requirementTypeService.save(requirementType)
            }
        }
    }
}

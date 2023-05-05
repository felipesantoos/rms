package rms

class BootStrap {
    PriorityService priorityService
    ProjectService projectService
    RequirementService requirementService
    RequirementOriginService requirementOriginService
    RequirementTypeService requirementTypeService

    def init = { servletContext ->
        loadPriorities()
        loadProjects()
        loadRequirementOrigins()
        loadRequirementTypes()
    }
    def destroy = {
    }

    private void loadPriorities() {
        ArrayList<Priority> priorities = [
                new Priority(level: "Alta"),
                new Priority(level: "Média"),
                new Priority(level: "Baixa")
        ]
        priorities.forEach {Priority priority ->
            priorityService.save(priority)
        }
    }

    private void loadProjects() {
        ArrayList<Project> projects = [
                new Project(name: "Project 1", alias: "P1", description: "Description 1", isActive: true),
                new Project(name: "Project 2", alias: "P2", description: "Description 2", isActive: true),
                new Project(name: "Project 3", alias: "P3", description: "Description 3", isActive: true)
        ]
        projects.forEach {Project project ->
            projectService.save(project)
        }
    }

    private void loadRequirementOrigins() {
        ArrayList<RequirementOrigin> requirementOrigins = [
                new RequirementOrigin(name: "Requisito de projeto"),
                new RequirementOrigin(name: "Requisito organizacional"),
                new RequirementOrigin(name: "Requisito externo")
        ]
        requirementOrigins.forEach {RequirementOrigin requirementOrigin ->
            requirementOriginService.save(requirementOrigin)
        }
    }

    private void loadRequirementTypes() {
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

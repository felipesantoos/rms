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
        loadRequirements()
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

    private void loadRequirements() {
        ArrayList<Requirement> requirements = [
                new Requirement(code: "P1-1", title: "Requirement 1", description: "Description 1", userStory: "As a... I want... so that... [1]", type: RequirementType.get(1), origin: RequirementOrigin.get(1), priority: Priority.get(1), project: Project.get(1)),
                new Requirement(code: "P1-2", title: "Requirement 2", description: "Description 2", userStory: "As a... I want... so that... [2]", type: RequirementType.get(2), origin: RequirementOrigin.get(2), priority: Priority.get(2), project: Project.get(2)),
                new Requirement(code: "P1-3", title: "Requirement 3", description: "Description 3", userStory: "As a... I want... so that... [3]", type: RequirementType.get(3), origin: RequirementOrigin.get(3), priority: Priority.get(3), project: Project.get(3))
        ]
        requirements.forEach {Requirement requirement ->
            requirementService.save(requirement)
        }
    }
}

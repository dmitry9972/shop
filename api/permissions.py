from rest_framework import permissions


class UserPermission(permissions.BasePermission):

    def has_permission(self, request, view):
        if view.action in ['create', 'retrieve', 'update', 'partial_update', 'destroy', ]:
            print(request.user.is_authenticated)
            print(request.user)
            print(request.auth)
            print(request.body)
            print(request.data)
            print(request.headers)
            return request.user.is_authenticated and request.user.is_staff
        elif view.action in ['list']:
            return True
        else:
            return False

    def has_object_permission(self, request, view, obj):

        if view.action in ['create', 'retrieve', 'update', 'partial_update', 'destroy', ]:
            print(request.user.is_authenticated)
            print(request.user)
            print(request.auth)
            print(request.body)
            print(request.data)
            print(request.headers)
            return request.user.is_authenticated and request.user.is_staff
        elif view.action in ['list']:
            return True
        else:
            return False


class CustomerPermission(permissions.BasePermission):

    def has_permission(self, request, view):
        if view.action in ['create', 'retrieve', 'update', 'partial_update', 'destroy', ]:
            print(request.user.is_authenticated)
            print(request.user)
            print(request.auth)
            print(request.body)
            print(request.data)
            print(request.headers)
            return request.user.is_authenticated
        elif view.action in ['list']:
            return request.user.is_authenticated and request.user.is_staff
        else:
            return False

    def has_object_permission(self, request, view, obj):

        if view.action in ['create', 'retrieve', 'update', 'partial_update', 'destroy', ]:
            print(request.user.is_authenticated)
            print(request.user)
            print(request.auth)
            print(request.body)
            print(request.data)
            print(request.headers)
            return request.user.is_authenticated
        elif view.action in ['list']:
            return request.user.is_authenticated and request.user.is_staff
        else:
            return False